// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract StudentSafetyDAO {
    address public steward;

    struct SafetyEvent {
        string schoolName; // "Bulacan High", "Northville Academy"
        string riskType; // "Earthquake", "Flood", "Infrastructure Crack"
        string actionTaken; // "Online Shift", "Modular Mode", "Temporary Suspension"
        string emotionalTag;
        uint256 timestamp;
    }

    SafetyEvent[] public events;

    event SafetyLogged(
        string schoolName,
        string riskType,
        string actionTaken,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only Vinvin may log student safety rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logSafety(
        string memory schoolName,
        string memory riskType,
        string memory actionTaken,
        string memory emotionalTag
    ) external onlySteward {
        events.push(SafetyEvent({
            schoolName: schoolName,
            riskType: riskType,
            actionTaken: actionTaken,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit SafetyLogged(schoolName, riskType, actionTaken, emotionalTag, block.timestamp);
    }
}
