// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BudgetForgivenessLedger {
    address public steward;

    struct ForgivenessEntry {
        string department;
        string budgetAnomaly;
        string forgivenessMechanism;
        string emotionalTag;
    }

    ForgivenessEntry[] public ledger;

    event BudgetForgiven(string department, string budgetAnomaly, string forgivenessMechanism, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function forgiveBudget(
        string memory department,
        string memory budgetAnomaly,
        string memory forgivenessMechanism,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(ForgivenessEntry(department, budgetAnomaly, forgivenessMechanism, emotionalTag));
        emit BudgetForgiven(department, budgetAnomaly, forgivenessMechanism, emotionalTag);
    }
}
