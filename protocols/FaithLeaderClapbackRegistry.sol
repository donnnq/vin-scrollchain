// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FaithLeaderClapbackRegistry {
    address public steward;

    struct ClapbackEntry {
        string timestamp;
        string rebukingLeader;
        string targetGroup;
        string doctrinalDefense;
        string emotionalTone;
        string civicImpact;
        string emotionalTag;
    }

    ClapbackEntry[] public registry;

    event ClapbackLogged(string timestamp, string rebukingLeader, string targetGroup, string doctrinalDefense, string emotionalTone, string civicImpact, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logClapback(
        string memory timestamp,
        string memory rebukingLeader,
        string memory targetGroup,
        string memory doctrinalDefense,
        string memory emotionalTone,
        string memory civicImpact,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(ClapbackEntry(timestamp, rebukingLeader, targetGroup, doctrinalDefense, emotionalTone, civicImpact, emotionalTag));
        emit ClapbackLogged(timestamp, rebukingLeader, targetGroup, doctrinalDefense, emotionalTone, civicImpact, emotionalTag);
    }
}
