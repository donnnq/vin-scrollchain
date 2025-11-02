// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MarineNutritionSovereigntyTreaty {
    address public steward;

    struct MarineClause {
        string barangay;
        string marineSource;
        string nutritionVerdict;
        string emotionalTag;
    }

    MarineClause[] public treatyLog;

    event MarineNutritionTagged(string barangay, string marineSource, string nutritionVerdict, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagMarineNutrition(
        string memory barangay,
        string memory marineSource,
        string memory nutritionVerdict,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(MarineClause(barangay, marineSource, nutritionVerdict, emotionalTag));
        emit MarineNutritionTagged(barangay, marineSource, nutritionVerdict, emotionalTag);
    }
}
