// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract AggressorExposureBroadcastDAO {
    address public steward;

    struct ExposureEvent {
        string aggressorNation; // "China"
        string incidentType; // "Water Cannon", "Ramming", "Helicopter Buzzing"
        string broadcastChannel; // "PCG Footage", "ANC News", "GMA", "Rappler"
        string emotionalTag;
        uint256 timestamp;
    }

    ExposureEvent[] public events;

    event ExposureLogged(
        string aggressorNation,
        string incidentType,
        string broadcastChannel,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only Vinvin may log exposure rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logExposure(
        string memory aggressorNation,
        string memory incidentType,
        string memory broadcastChannel,
        string memory emotionalTag
    ) external onlySteward {
        events.push(ExposureEvent({
            aggressorNation: aggressorNation,
            incidentType: incidentType,
            broadcastChannel: broadcastChannel,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit ExposureLogged(aggressorNation, incidentType, broadcastChannel, emotionalTag, block.timestamp);
    }
}
