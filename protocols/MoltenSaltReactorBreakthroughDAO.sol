// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MoltenSaltReactorBreakthroughDAO {
    address public steward;

    struct BreakthroughEntry {
        string location;
        string reactorType;
        string milestone;
        string emotionalTag;
    }

    BreakthroughEntry[] public registry;

    event ReactorBreakthroughBroadcasted(string location, string reactorType, string milestone, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastBreakthrough(
        string memory location,
        string memory reactorType,
        string memory milestone,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(BreakthroughEntry(location, reactorType, milestone, emotionalTag));
        emit ReactorBreakthroughBroadcasted(location, reactorType, milestone, emotionalTag);
    }
}
