// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OnboardingCostCodex {
    address public steward;

    struct CostClause {
        string employerName;
        string costType;
        string paymentOption;
        string emotionalTag;
    }

    CostClause[] public codex;

    event OnboardingCostLogged(string employerName, string costType, string paymentOption, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logOnboardingCost(
        string memory employerName,
        string memory costType,
        string memory paymentOption,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(CostClause(employerName, costType, paymentOption, emotionalTag));
        emit OnboardingCostLogged(employerName, costType, paymentOption, emotionalTag);
    }
}
