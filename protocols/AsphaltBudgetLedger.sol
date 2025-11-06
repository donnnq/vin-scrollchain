// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AsphaltBudgetLedger {
    address public steward;

    struct BudgetEntry {
        string roadName;
        string damageLevel;
        string budgetAmount;
        string emotionalTag;
    }

    BudgetEntry[] public ledger;

    event AsphaltBudgetTagged(string roadName, string damageLevel, string budgetAmount, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagBudget(
        string memory roadName,
        string memory damageLevel,
        string memory budgetAmount,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(BudgetEntry(roadName, damageLevel, budgetAmount, emotionalTag));
        emit AsphaltBudgetTagged(roadName, damageLevel, budgetAmount, emotionalTag);
    }
}
