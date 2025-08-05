// SPDX-License-Identifier: FORGIVENESS-CHAMBER
pragma solidity ^0.8.19;

contract vinForgivenessChamber {
    enum ForgivenessStatus { None, PleaSubmitted, AwaitingVote, Accepted, Rejected }

    struct ForgivenessRite {
        address respondent;
        uint trialId;
        string ritualMessage;
        uint votesFor;
        uint votesAgainst;
        ForgivenessStatus status;
        uint timestamp;
    }

    address public chamberClerk;
    uint public voteThreshold = 10;
    uint public cooldownPeriod = 30 days;

    mapping(uint => ForgivenessRite) public rites;
    mapping(address => uint) public lastTrialRemoval;

    event ForgivenessRequested(uint trialId, address respondent, string message);
    event ForgivenessVoted(uint trialId, bool approve, address voter);
    event ForgivenessGranted(uint trialId, address respondent);
    event ForgivenessDenied(uint trialId, address respondent);

    modifier onlyClerk() {
        require(msg.sender == chamberClerk, "Clerk only");
        _;
    }

    constructor() {
        chamberClerk = msg.sender;
    }

    function submitForgivenessRite(uint trialId, string calldata message) external {
        require(block.timestamp >= lastTrialRemoval[msg.sender] + cooldownPeriod, "Too soon for forgiveness");
        rites[trialId] = ForgivenessRite(msg.sender, trialId, message, 0, 0, ForgivenessStatus.PleaSubmitted, block.timestamp);
        emit ForgivenessRequested(trialId, msg.sender, message);
    }

    function voteForgiveness(uint trialId, bool support) external {
        ForgivenessRite storage rite = rites[trialId];
        require(rite.status == ForgivenessStatus.PleaSubmitted || rite.status == ForgivenessStatus.AwaitingVote, "Invalid status");

        if (support) rite.votesFor++;
        else rite.votesAgainst++;

        rite.status = ForgivenessStatus.AwaitingVote;

        emit ForgivenessVoted(trialId, support, msg.sender);

        if (rite.votesFor + rite.votesAgainst >= voteThreshold) {
            finalizeForgiveness(trialId);
        }
    }

    function finalizeForgiveness(uint trialId) internal {
        ForgivenessRite storage rite = rites[trialId];

        if (rite.votesFor > rite.votesAgainst) {
            rite.status = ForgivenessStatus.Accepted;
            emit ForgivenessGranted(trialId, rite.respondent);
        } else {
            rite.status = ForgivenessStatus.Rejected;
            emit ForgivenessDenied(trialId, rite.respondent);
        }
    }

    function logRemovalTime(address respondent, uint time) external onlyClerk {
        lastTrialRemoval[respondent] = time;
    }

    function getRiteStatus(uint trialId) external view returns (ForgivenessStatus) {
        return rites[trialId].status;
    }
}
