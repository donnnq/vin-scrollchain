// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HeritageRecipeFellowship {
    address public admin;

    struct RecipeEntry {
        string recipeName;
        string originRegion;
        string emotionalTag;
        bool archived;
        bool shared;
    }

    RecipeEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function archiveRecipe(string memory recipeName, string memory originRegion, string memory emotionalTag) external onlyAdmin {
        entries.push(RecipeEntry(recipeName, originRegion, emotionalTag, true, false));
    }

    function shareRecipe(uint256 index) external onlyAdmin {
        entries[index].shared = true;
    }

    function getRecipe(uint256 index) external view returns (RecipeEntry memory) {
        return entries[index];
    }
}
