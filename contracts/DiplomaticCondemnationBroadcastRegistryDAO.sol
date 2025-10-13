// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract DiplomaticCondemnationBroadcastRegistryDAO {
    address public steward;

    struct CondemnationEvent {
        string condemningNation; // "USA", "Japan", "EU", "ASEAN Bloc"
        string incidentType; // "Water Cannon", "Ramming", "Helicopter Buzzing"
        string broadcastChannel; // "UN Statement", "Press Briefing", "Joint Declaration"
        string emotionalTag;
        uint256 timestamp;
    }

    CondemnationEvent[] public events;

    event CondemnationLogged(
        string condemningNation,
        string incidentType,
        string broadcastChannel,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only Vinvin may log diplomatic condemnation rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logCondemnation(
        string memory condemningNation,
        string memory incidentType,
        string memory broadcastChannel,
        string memory emotionalTag
    ) external onlySteward {
        events.push(CondemnationEvent({
            condemningNation: condemningNation,
            incidentType: incidentType,
            broadcastChannel: broadcastChannel,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit CondemnationLogged(condemningNation, incidentType, broadcastChannel, emotionalTag, block.timestamp);
    }
}
