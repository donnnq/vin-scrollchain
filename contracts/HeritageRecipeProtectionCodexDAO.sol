// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HeritageRecipeProtectionCodexDAO {
    address public admin;

    struct RecipeEntry {
        string recipeLabel;
        string protectionClause;
        string emotionalTag;
        bool sealed;
    }

    RecipeEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _recipeLabel, string memory _protectionClause, string memory _emotionalTag) external onlyAdmin {
        codex.push(RecipeEntry(_recipeLabel, _protectionClause, _emotionalTag, false));
    }

    function sealEntry(uint256 index) external onlyAdmin {
        codex[index].sealed = true;
    }

    function getEntry(uint256 index) external view returns (RecipeEntry memory) {
        return codex[index];
    }
}
