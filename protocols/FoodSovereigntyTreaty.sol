// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FoodSovereigntyTreaty {
    address public steward;

    struct SovereigntyClause {
        string populationGroup;
        string nourishmentRight;
        string policyStatus;
        string emotionalTag;
    }

    SovereigntyClause[] public treatyLog;

    event FoodSovereigntyTagged(string populationGroup, string nourishmentRight, string policyStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagFoodSovereignty(
        string memory populationGroup,
        string memory nourishmentRight,
        string memory policyStatus,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(SovereigntyClause(populationGroup, nourishmentRight, policyStatus, emotionalTag));
        emit FoodSovereigntyTagged(populationGroup, nourishmentRight, policyStatus, emotionalTag);
    }
}
