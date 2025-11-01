// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HeritageRecipeProtection {
    address public steward;

    struct RecipeEntry {
        string recipeName;
        string ancestralOrigin;
        string protectionLevel;
        string emotionalTag;
    }

    RecipeEntry[] public registry;

    event RecipeProtected(string recipeName, string ancestralOrigin, string protectionLevel, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function protectRecipe(
        string memory recipeName,
        string memory ancestralOrigin,
        string memory protectionLevel,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(RecipeEntry(recipeName, ancestralOrigin, protectionLevel, emotionalTag));
        emit RecipeProtected(recipeName, ancestralOrigin, protectionLevel, emotionalTag);
    }
}
