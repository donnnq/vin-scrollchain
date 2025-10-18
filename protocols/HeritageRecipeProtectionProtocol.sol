// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HeritageRecipeProtectionProtocol {
    address public admin;

    struct RecipeEntry {
        string recipeName;
        string culturalOrigin;
        string emotionalTag;
        bool summoned;
        bool verified;
        bool protected;
    }

    RecipeEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonRecipe(string memory recipeName, string memory culturalOrigin, string memory emotionalTag) external onlyAdmin {
        entries.push(RecipeEntry(recipeName, culturalOrigin, emotionalTag, true, false, false));
    }

    function verifyRecipe(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function protectRecipe(uint256 index) external onlyAdmin {
        require(entries[index].verified, "Must be verified first");
        entries[index].protected = true;
    }

    function getRecipeEntry(uint256 index) external view returns (RecipeEntry memory) {
        return entries[index];
    }
}
