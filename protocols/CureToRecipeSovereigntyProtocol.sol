// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CureToRecipeSovereigntyProtocol {
    address public steward;

    struct RecipeEntry {
        string medicineName; // "QuantumPainX"
        string discoveryOrigin; // "Philippines"
        string recipeProtectionMethod; // "Scrollchain-sealed formula"
        string emotionalTag;
        bool protected;
        bool sealed;
    }

    RecipeEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function protectRecipe(string memory medicineName, string memory discoveryOrigin, string memory recipeProtectionMethod, string memory emotionalTag) external onlySteward {
        entries.push(RecipeEntry(medicineName, discoveryOrigin, recipeProtectionMethod, emotionalTag, true, false));
    }

    function sealRecipeEntry(uint256 index) external onlySteward {
        require(entries[index].protected, "Must be protected first");
        entries[index].sealed = true;
    }

    function getRecipeEntry(uint256 index) external view returns (RecipeEntry memory) {
        return entries[index];
    }
}
