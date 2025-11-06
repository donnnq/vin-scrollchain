// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TreePlantingBudgetDAO {
    address public steward;

    struct BudgetEntry {
        string projectName;
        string fundingSource;
        string allocationAmount;
        string emotionalTag;
    }

    BudgetEntry[] public registry;

    event TreeBudgetBroadcasted(string projectName, string fundingSource, string allocationAmount, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastBudget(
        string memory projectName,
        string memory fundingSource,
        string memory allocationAmount,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(BudgetEntry(projectName, fundingSource, allocationAmount, emotionalTag));
        emit TreeBudgetBroadcasted(projectName, fundingSource, allocationAmount, emotionalTag);
    }
}
