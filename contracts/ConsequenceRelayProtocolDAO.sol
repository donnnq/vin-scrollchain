// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ConsequenceRelayProtocolDAO {
    address public steward;

    struct RelayEvent {
        string aggressorNation; // "China"
        string consequenceType; // "Diplomatic Isolation", "Sanctions", "Military Response"
        string relayNation; // "USA", "Japan", "Australia", "ASEAN Bloc"
        string emotionalTag;
        uint256 timestamp;
    }

    RelayEvent[] public events;

    event RelayLogged(
        string aggressorNation,
        string consequenceType,
        string relayNation,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only Vinvin may log consequence relay rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logRelay(
        string memory aggressorNation,
        string memory consequenceType,
        string memory relayNation,
        string memory emotionalTag
    ) external onlySteward {
        events.push(RelayEvent({
            aggressorNation: aggressorNation,
            consequenceType: consequenceType,
            relayNation: relayNation,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit RelayLogged(aggressorNation, consequenceType, relayNation, emotionalTag, block.timestamp);
    }
}
