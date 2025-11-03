// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FoodCourtSovereigntyDAO {
    address public steward;

    struct FoodEntry {
        string mallName;
        string foodCourtStatus;
        string revivalPlan;
        string emotionalTag;
    }

    FoodEntry[] public registry;

    event FoodCourtSovereigntyTagged(string mallName, string foodCourtStatus, string revivalPlan, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagFoodCourt(
        string memory mallName,
        string memory foodCourtStatus,
        string memory revivalPlan,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(FoodEntry(mallName, foodCourtStatus, revivalPlan, emotionalTag));
        emit FoodCourtSovereigntyTagged(mallName, foodCourtStatus, revivalPlan, emotionalTag);
    }
}
