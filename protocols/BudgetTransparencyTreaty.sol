// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BudgetTransparencyTreaty {
    address public steward;

    struct TreatyClause {
        string budgetDomain;
        string transparencySignal;
        string treatyMechanism;
        string emotionalTag;
    }

    TreatyClause[] public treatyLog;

    event BudgetTransparencyTagged(string budgetDomain, string transparencySignal, string treatyMechanism, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagTransparency(
        string memory budgetDomain,
        string memory transparencySignal,
        string memory treatyMechanism,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(TreatyClause(budgetDomain, transparencySignal, treatyMechanism, emotionalTag));
        emit BudgetTransparencyTagged(budgetDomain, transparencySignal, treatyMechanism, emotionalTag);
    }
}
