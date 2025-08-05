pragma solidity ^0.8.18;

contract vinFootprintGlyphLedger {
    address public ledgerMaster;

    struct FootprintLog {
        string walkerID;        // e.g. wallet address or QR-linked civic alias
        string tileID;
        string activatedGlyph;  // e.g. "riceUnityTrail", "bayanWave"
        string moodSignal;      // e.g. "Gratitude", "Urgency", "Hope"
        uint256 pressureValue;
        uint256 timestamp;
    }

    FootprintLog[] public ledgerEntries;

    event StepLogged(string walkerID, string tileID, string activatedGlyph, string moodSignal);

    modifier onlyMaster() {
        require(msg.sender == ledgerMaster, "Not authorized");
        _;
    }

    constructor(address _master) {
        ledgerMaster = _master;
    }

    function logStep(
        string memory _walkerID,
        string memory _tileID,
        string memory _activatedGlyph,
        string memory _moodSignal,
        uint256 _pressureValue
    ) external onlyMaster {
        ledgerEntries.push(FootprintLog(
            _walkerID,
            _tileID,
            _activatedGlyph,
            _moodSignal,
            _pressureValue,
            block.timestamp
        ));

        emit StepLogged(_walkerID, _tileID, _activatedGlyph, _moodSignal);
    }

    function getAllSteps() external view returns (FootprintLog[] memory) {
        return ledgerEntries;
    }

    function getLastStep() external view returns (FootprintLog memory) {
        require(ledgerEntries.length > 0, "No steps logged yet");
        return ledgerEntries[ledgerEntries.length - 1];
    }
}
