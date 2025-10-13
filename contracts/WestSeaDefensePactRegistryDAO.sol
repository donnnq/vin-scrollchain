// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract WestSeaDefensePactRegistryDAO {
    address public steward;

    struct PactEvent {
        string memberNation; // "Philippines", "Vietnam", "Malaysia", "USA"
        string pactClause; // "Mutual Defense", "Joint Patrol", "Sovereignty Recognition"
        string activationStatus; // "Ratified", "Pending", "Invoked"
        string emotionalTag;
        uint256 timestamp;
    }

    PactEvent[] public events;

    event PactLogged(
        string memberNation,
        string pactClause,
        string activationStatus,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only Vinvin may log West Sea defense pact rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logPact(
        string memory memberNation,
        string memory pactClause,
        string memory activationStatus,
        string memory emotionalTag
    ) external onlySteward {
        events.push(PactEvent({
            memberNation: memberNation,
            pactClause: pactClause,
            activationStatus: activationStatus,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit PactLogged(memberNation, pactClause, activationStatus, emotionalTag, block.timestamp);
    }
}
