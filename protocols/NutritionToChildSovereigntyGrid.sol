// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NutritionToChildSovereigntyGrid {
    address public steward;

    struct ChildNutritionEntry {
        string foodSource; // "Community kitchen", "Diaspora pantry"
        string nutritionType; // "School meals", "Infant formula", "Vitamin access"
        string deliveryMethod; // "Local steward", "Mobile unit"
        string emotionalTag;
        bool deployed;
        bool sealed;
    }

    ChildNutritionEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function deployChildNutrition(string memory foodSource, string memory nutritionType, string memory deliveryMethod, string memory emotionalTag) external onlySteward {
        entries.push(ChildNutritionEntry(foodSource, nutritionType, deliveryMethod, emotionalTag, true, false));
    }

    function sealChildNutritionEntry(uint256 index) external onlySteward {
        require(entries[index].deployed, "Must be deployed first");
        entries[index].sealed = true;
    }

    function getChildNutritionEntry(uint256 index) external view returns (ChildNutritionEntry memory) {
        return entries[index];
    }
}
