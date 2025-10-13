// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract GlobalHumiliationRelayProtocolDAO {
    address public steward;

    struct HumiliationEvent {
        string aggressorNation; // "China"
        string incidentType; // "Water Cannon", "Ramming"
        string relayNation; // "USA", "Japan", "EU", "ASEAN"
        string consequenceType; // "Condemnation", "Sanction", "Media Exposure"
        string emotionalTag;
        uint256 timestamp;
    }

    HumiliationEvent[] public events;

    event HumiliationLogged(
        string aggressorNation,
        string incidentType,
        string relayNation,
        string consequenceType,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only Vinvin may log humiliation relay rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logHumiliation(
        string memory aggressorNation,
        string memory incidentType,
        string memory relayNation,
        string memory consequenceType,
        string memory emotionalTag
    ) external onlySteward {
        events.push(HumiliationEvent({
            aggressorNation: aggressorNation,
            incidentType: incidentType,
            relayNation: relayNation,
            consequenceType: consequenceType,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit HumiliationLogged(aggressorNation, incidentType, relayNation, consequenceType, emotionalTag, block.timestamp);
    }
}
