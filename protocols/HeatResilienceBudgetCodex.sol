// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HeatResilienceBudgetCodex {
    address public steward;

    struct BudgetClause {
        string programName;
        string fundingSource;
        string allocationAmount;
        string emotionalTag;
    }

    BudgetClause[] public codex;

    event HeatResilienceBudgetTagged(string programName, string fundingSource, string allocationAmount, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagBudget(
        string memory programName,
        string memory fundingSource,
        string memory allocationAmount,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(BudgetClause(programName, fundingSource, allocationAmount, emotionalTag));
        emit HeatResilienceBudgetTagged(programName, fundingSource, allocationAmount, emotionalTag);
    }
}
