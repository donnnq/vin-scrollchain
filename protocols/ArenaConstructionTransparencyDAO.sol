// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArenaConstructionTransparencyDAO {
    address public steward;

    struct ConstructionEntry {
        string projectName;
        string budgetStatus;
        string timelineStatus;
        string civicImpact;
        string emotionalTag;
    }

    ConstructionEntry[] public registry;

    event ArenaConstructionTagged(string projectName, string budgetStatus, string timelineStatus, string civicImpact, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagConstruction(
        string memory projectName,
        string memory budgetStatus,
        string memory timelineStatus,
        string memory civicImpact,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(ConstructionEntry(projectName, budgetStatus, timelineStatus, civicImpact, emotionalTag));
        emit ArenaConstructionTagged(projectName, budgetStatus, timelineStatus, civicImpact, emotionalTag);
    }
}
