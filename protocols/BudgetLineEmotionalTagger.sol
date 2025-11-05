// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BudgetLineEmotionalTagger {
    address public steward;

    struct TagEntry {
        string budgetItem;
        string department;
        string emotionalTag;
        string dignityProtocol;
    }

    TagEntry[] public registry;

    event BudgetLineTagged(string budgetItem, string department, string emotionalTag, string dignityProtocol);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagBudgetLine(
        string memory budgetItem,
        string memory department,
        string memory emotionalTag,
        string memory dignityProtocol
    ) public onlySteward {
        registry.push(TagEntry(budgetItem, department, emotionalTag, dignityProtocol));
        emit BudgetLineTagged(budgetItem, department, emotionalTag, dignityProtocol);
    }
}
