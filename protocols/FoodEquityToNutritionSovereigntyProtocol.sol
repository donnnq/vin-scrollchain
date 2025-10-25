// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FoodEquityToNutritionSovereigntyProtocol {
    address public steward;

    struct NutritionEntry {
        string foodSource; // "Community kitchen", "Diaspora fundrun", "Ghost city repurposed asset"
        string nutritionGoal; // "Macrobiotic access", "Child nourishment", "Elder care"
        string deliveryMethod; // "Local steward", "Diaspora logistics"
        string emotionalTag;
        bool activated;
        bool sealed;
    }

    NutritionEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function activateNutrition(string memory foodSource, string memory nutritionGoal, string memory deliveryMethod, string memory emotionalTag) external onlySteward {
        entries.push(NutritionEntry(foodSource, nutritionGoal, deliveryMethod, emotionalTag, true, false));
    }

    function sealNutritionEntry(uint256 index) external onlySteward {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getNutritionEntry(uint256 index) external view returns (NutritionEntry memory) {
        return entries[index];
    }
}
