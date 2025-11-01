// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SubmarineCableImmunityTreaty {
    address public steward;

    struct CableZone {
        string cableID;
        string location;
        string immunityLevel;
        string emotionalTag;
    }

    CableZone[] public treatyLog;

    event CableImmunityGranted(string cableID, string location, string immunityLevel, string emotionalTag);
    event SpyBotDetected(string cableID, string threatLevel);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function grantImmunity(
        string memory cableID,
        string memory location,
        string memory immunityLevel,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(CableZone(cableID, location, immunityLevel, emotionalTag));
        emit CableImmunityGranted(cableID, location, immunityLevel, emotionalTag);
    }

    function detectSpyBot(string memory cableID, string memory threatLevel) public onlySteward {
        emit SpyBotDetected(cableID, threatLevel);
    }
}
