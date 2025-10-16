// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HeritageRecipeProtectionDAO {
    address public admin;

    struct RecipeEntry {
        string recipeName;
        string ancestralOrigin;
        string preservationMethod;
        string emotionalTag;
        bool protected;
        bool archived;
    }

    RecipeEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function protectRecipe(string memory recipeName, string memory ancestralOrigin, string memory preservationMethod, string memory emotionalTag) external onlyAdmin {
        entries.push(RecipeEntry(recipeName, ancestralOrigin, preservationMethod, emotionalTag, true, false));
    }

    function archiveRecipe(uint256 index) external onlyAdmin {
        entries[index].archived = true;
    }

    function getRecipe(uint256 index) external view returns (RecipeEntry memory) {
        return entries[index];
    }
}
