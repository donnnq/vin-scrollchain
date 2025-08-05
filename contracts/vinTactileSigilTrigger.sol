pragma solidity ^0.8.18;

contract vinTactileSigilTrigger {
    address public sigilMaster;

    struct FootTrigger {
        string tileID;
        string sigilGlyph;        // e.g. "palayBlessing", "scrollPulse", "riceUnityTrail"
        uint256 pressureThreshold;
        string responseType;      // e.g. "LightPulse", "SoundChime", "DAOVoteRipple"
        uint256 lastActivated;
        bool active;
    }

    mapping(string => FootTrigger) public triggerMap;

    event SigilActivated(string tileID, string sigilGlyph, string responseType, uint256 timestamp);

    modifier onlyMaster() {
        require(msg.sender == sigilMaster, "Not authorized");
        _;
    }

    constructor(address _master) {
        sigilMaster = _master;
    }

    function registerTileTrigger(
        string memory _tileID,
        string memory _sigilGlyph,
        uint256 _pressureThreshold,
        string memory _responseType
    ) external onlyMaster {
        triggerMap[_tileID] = FootTrigger(_tileID, _sigilGlyph, _pressureThreshold, _responseType, 0, true);
    }

    function triggerSigil(string memory _tileID, uint256 pressureInput) external {
        FootTrigger storage trigger = triggerMap[_tileID];
        require(trigger.active, "Tile inactive");

        if (pressureInput >= trigger.pressureThreshold) {
            trigger.lastActivated = block.timestamp;
            emit SigilActivated(_tileID, trigger.sigilGlyph, trigger.responseType, block.timestamp);
        }
    }

    function deactivateTile(string memory _tileID) external onlyMaster {
        triggerMap[_tileID].active = false;
    }
}
