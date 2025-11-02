// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayFoodEquityTreaty {
    address public steward;

    struct FoodClause {
        string barangay;
        string foodType;
        string equityStatus;
        string emotionalTag;
    }

    FoodClause[] public treatyLog;

    event FoodEquityTagged(string barangay, string foodType, string equityStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagFoodEquity(
        string memory barangay,
        string memory foodType,
        string memory equityStatus,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(FoodClause(barangay, foodType, equityStatus, emotionalTag));
        emit FoodEquityTagged(barangay, foodType, equityStatus, emotionalTag);
    }
}
