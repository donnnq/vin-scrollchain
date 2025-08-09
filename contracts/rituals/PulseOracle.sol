// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * Interfaces to upstream telemetry.
 * Assumes CivicPulse.getBarangayPulse returns tuple encoding of the struct.
 * Assumes HubPulse.getCenterStatus returns:
 * 0=Inactive, 1=Active, 2=Thriving, 3=UnderAudit
 */
interface ICivicPulse {
    function getBarangayPulse(string calldata barangay)
        external
        view
        returns (
            uint256 traineeCount,
            uint256 certifiedCount,
            uint256 stipendTotal,
            uint256 feedbackScore, // 0..100
            uint256 lastUpdate
        );

    function listBarangays() external view returns (string[] memory);
}

interface IHubPulse {
    function getCenterStatus(string calldata location) external view returns (uint8);
}

contract PulseOracle {
    address public oracle;
    ICivicPulse public civicPulse;
    IHubPulse public hubPulse;

    // Weights and thresholds (tweak to calibrate)
    struct Weights {
        uint256 wCertified;         // per certified trainee
        uint256 wTrainee;           // per trainee
        uint256 wFeedback;          // per feedback point (0..100)
        uint256 wStipendPerCapita;  // penalty per stipend-per-trainee unit
        uint256 scale;              // scaling factor to keep integers (e.g., 1e6)
    }

    struct Thresholds {
        uint256 celebrateScore;     // >= => Celebrate
        uint256 mentorScore;        // < => DeployMentors
        uint256 boostScore;         // < => BoostStipend
        uint256 openHubScore;       // >= and hub inactive => OpenNewHub
        int256  growthTrendMin;     // >= => Growth, <= -x => Decline
        int256  declineTrendMax;    // <= => Decline
    }

    Weights public weights;
    Thresholds public thresholds;

    // Stored history for trend computation
    struct History {
        uint256 prevScore;
        uint256 lastScore;
        uint256 lastUpdate;
    }
    mapping(string => History) public history; // keyed by barangay name

    enum Action {
        None,
        BoostStipend,   // increase stipend or optimize payout cadence
        OpenNewHub,     // spin up or reactivate hub where demand is high
        DeployMentors,  // send assessors/trainers to lift certification rate
        EmployerDrive,  // run employer/job fairs to absorb ready talent
        AuditCenter,    // governance review if anomalies
        Celebrate       // showcase, replicate, reward
    }

    enum Forecast {
        Unknown,
        Growth,
        Plateau,
        Decline
    }

    event SnapshotRecorded(
        string barangay,
        uint256 score,
        int256 trend,
        Action action,
        Forecast forecast,
        uint8 hubStatus,
        uint256 timestamp
    );

    modifier onlyOracle() {
        require(msg.sender == oracle, "Not authorized");
        _;
    }

    constructor(address _civicPulse, address _hubPulse) {
        oracle = msg.sender;
        civicPulse = ICivicPulse(_civicPulse);
        hubPulse = IHubPulse(_hubPulse);

        // Sensible defaults (tune on mainnet after a week of data)
        weights = Weights({
            wCertified: 20,         // each certified counts 20
            wTrainee: 5,            // each trainee counts 5
            wFeedback: 2,           // each feedback point (0..100) counts 2
            wStipendPerCapita: 1,   // penalty per stipend unit per trainee
            scale: 1                // keep simple; you can raise to 1e3..1e6 if needed
        });

        thresholds = Thresholds({
            celebrateScore: 5000,
            mentorScore: 1500,
            boostScore: 1000,
            openHubScore: 2500,
            growthTrendMin: 150,    // +trend threshold
            declineTrendMax: -150   // -trend threshold
        });
    }

    // Admin tuning
    function setWeights(Weights calldata w) external onlyOracle {
        weights = w;
    }

    function setThresholds(Thresholds calldata t) external onlyOracle {
        thresholds = t;
    }

    function transferOracle(address newOracle) external onlyOracle {
        oracle = newOracle;
    }

    // Core scoring logic
    function computeScore(string calldata barangay)
        public
        view
        returns (uint256 score, uint256 stipendPerCapita, uint8 hubStatus)
    {
        (
            uint256 traineeCount,
            uint256 certifiedCount,
            uint256 stipendTotal,
            uint256 feedbackScore,
            /* lastUpdate */
        ) = civicPulse.getBarangayPulse(barangay);

        uint256 denom = traineeCount == 0 ? 1 : traineeCount;
        stipendPerCapita = stipendTotal / denom; // integer division

        // Score = +certified*w1 + trainees*w2 + feedback*w3 - stipenCap*w4
        uint256 positive = certifiedCount * weights.wCertified
            + traineeCount * weights.wTrainee
            + feedbackScore * weights.wFeedback;

        uint256 penalty = stipendPerCapita * weights.wStipendPerCapita;

        // Guard against underflow
        score = positive > penalty ? (positive - penalty) * weights.scale : 0;

        hubStatus = hubPulse.getCenterStatus(barangay);
        return (score, stipendPerCapita, hubStatus);
    }

    // Analyze and recommend action without state change
    function analyzeBarangay(string calldata barangay)
        external
        view
        returns (uint256 score, int256 trend, Action action, Forecast forecast, uint8 hubStatus)
    {
        (score, , hubStatus) = computeScore(barangay);
        History memory h = history[barangay];
        trend = int256(score) - int256(h.lastScore);
        (action, forecast) = _decide(score, trend, hubStatus, barangay);
    }

    // Record a snapshot (updates history) and emits recommendation
    function snapshot(string calldata barangay)
        external
        returns (uint256 score, int256 trend, Action action, Forecast forecast)
    {
        (score, , uint8 hubStatus) = computeScore(barangay);
        History storage h = history[barangay];

        // Compute trend vs last
        trend = int256(score) - int256(h.lastScore);

        // Shift history
        h.prevScore = h.lastScore;
        h.lastScore = score;
        h.lastUpdate = block.timestamp;

        (action, forecast) = _decide(score, trend, hubStatus, barangay);

        emit SnapshotRecorded(barangay, score, trend, action, forecast, hubStatus, block.timestamp);
    }

    // Batch snapshotting for multiple barangays (gas: consider chunking)
    function snapshotMany(string[] calldata barangays) external {
        for (uint256 i = 0; i < barangays.length; i++) {
            snapshot(barangays[i]);
        }
    }

    // Pull list from CivicPulse and snapshot all
    function snapshotAllFromCivic() external {
        string[] memory b = civicPulse.listBarangays();
        for (uint256 i = 0; i < b.length; i++) {
            snapshot(b[i]);
        }
    }

    // Get stored history
    function getHistory(string calldata barangay) external view returns (History memory) {
        return history[barangay];
    }

    // Internal decision engine
    function _decide(
        uint256 score,
        int256 trend,
        uint8 hubStatus,
        string calldata barangay
    ) internal view returns (Action action, Forecast forecast) {
        // Forecast from trend
        if (trend >= thresholds.growthTrendMin) {
            forecast = Forecast.Growth;
        } else if (trend <= thresholds.declineTrendMax) {
            forecast = Forecast.Decline;
        } else {
            forecast = Forecast.Plateau;
        }

        // Baseline actions by hub status
        if (hubStatus == 3) { // UnderAudit
            return (Action.AuditCenter, forecast);
        }
        if (hubStatus == 0) { // Inactive
            if (score >= thresholds.openHubScore) {
                return (Action.OpenNewHub, forecast);
            }
            // fall through to more nuanced checks
        }

        // Score- and trend-based actions
        if (score >= thresholds.celebrateScore) {
            return (Action.Celebrate, forecast);
        }

        // If score is low and trend falling, boost dignity flow
        if (score < thresholds.boostScore && trend <= 0) {
            return (Action.BoostStipend, forecast);
        }

        // If many trainees but low conversion to certified -> DeployMentors
        // We estimate conversion using score vs trainees: if growth slow, push mentors
        // Since we don't have raw counts here, use score midband + non-growth
        if (score < thresholds.mentorScore && trend <= 0) {
            return (Action.DeployMentors, forecast);
        }

        // If score decent but not celebrated, activate employers to absorb talent
        if (score >= thresholds.mentorScore && trend >= 0) {
            return (Action.EmployerDrive, forecast);
        }

        // Default to None (monitor)
        return (Action.None, forecast);
    }
}
