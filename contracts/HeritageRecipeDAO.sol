// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HeritageRecipeDAO {
    address public admin;

    struct RecipeEntry {
        string recipeLabel;
        string protectionClause;
        string emotionalTag;
        bool preserved;
    }

    RecipeEntry[] public recipes;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _recipeLabel, string memory _protectionClause, string memory _emotionalTag) external onlyAdmin {
        recipes.push(RecipeEntry(_recipeLabel, _protectionClause, _emotionalTag, false));
    }

    function preserveEntry(uint256 index) external onlyAdmin {
        recipes[index].preserved = true;
    }

    function getEntry(uint256 index) external view returns (RecipeEntry memory) {
        return recipes[index];
    }
}
