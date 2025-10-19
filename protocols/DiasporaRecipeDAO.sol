// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DiasporaRecipeDAO {
    address public admin;

    struct RecipeEntry {
        string dishName;
        string diasporaOrigin;
        string adaptationClause;
        string emotionalTag;
        bool summoned;
        bool archived;
        bool sealed;
    }

    RecipeEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonRecipe(string memory dishName, string memory diasporaOrigin, string memory adaptationClause, string memory emotionalTag) external onlyAdmin {
        entries.push(RecipeEntry(dishName, diasporaOrigin, adaptationClause, emotionalTag, true, false, false));
    }

    function confirmArchival(uint256 index) external onlyAdmin {
        entries[index].archived = true;
    }

    function sealRecipeEntry(uint256 index) external onlyAdmin {
        require(entries[index].archived, "Must be archived first");
        entries[index].sealed = true;
    }

    function getRecipeEntry(uint256 index) external view returns (RecipeEntry memory) {
        return entries[index];
    }
}
