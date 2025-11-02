// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MicroDeductionSupportCodex {
    address public steward;

    struct DeductionClause {
        string workerName;
        string expenseType;
        string deductionPlan;
        string emotionalTag;
    }

    DeductionClause[] public codex;

    event MicroDeductionLogged(string workerName, string expenseType, string deductionPlan, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logMicroDeduction(
        string memory workerName,
        string memory expenseType,
        string memory deductionPlan,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(DeductionClause(workerName, expenseType, deductionPlan, emotionalTag));
        emit MicroDeductionLogged(workerName, expenseType, deductionPlan, emotionalTag);
    }
}
