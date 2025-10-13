// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ASEANSolidarityAmplifierRegistryDAO {
    address public steward;

    struct SolidarityEvent {
        string memberNation; // "Vietnam", "Malaysia", "Indonesia"
        string supportType; // "Diplomatic Statement", "Joint Patrol", "UN Vote"
        string amplifierSignal; // "Sovereignty Support", "China Deterrence"
        string emotionalTag;
        uint256 timestamp;
    }

    SolidarityEvent[] public events;

    event SolidarityLogged(
        string memberNation,
        string supportType,
        string amplifierSignal,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only Vinvin may log ASEAN solidarity rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logSolidarity(
        string memory memberNation,
        string memory supportType,
        string memory amplifierSignal,
        string memory emotionalTag
    ) external onlySteward {
        events.push(SolidarityEvent({
            memberNation: memberNation,
            supportType: supportType,
            amplifierSignal: amplifierSignal,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit SolidarityLogged(memberNation, supportType, amplifierSignal, emotionalTag, block.timestamp);
    }
}
