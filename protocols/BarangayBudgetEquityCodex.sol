// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayBudgetEquityCodex {
    address public steward;

    struct EquityEntry {
        string barangay;
        string budgetDomain;
        string equitySignal;
        string emotionalTag;
    }

    EquityEntry[] public codex;

    event BudgetEquityTagged(string barangay, string budgetDomain, string equitySignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagEquity(
        string memory barangay,
        string memory budgetDomain,
        string memory equitySignal,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(EquityEntry(barangay, budgetDomain, equitySignal, emotionalTag));
        emit BudgetEquityTagged(barangay, budgetDomain, equitySignal, emotionalTag);
    }
}
