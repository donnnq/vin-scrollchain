// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HeritageRecipeProtectionProtocol {
    address public admin;

    struct RecipeEntry {
        string recipeName;
        string ancestralOrigin;
        string steward;
        string emotionalTag;
        bool summoned;
        bool protected;
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

    function summonRecipe(string memory recipeName, string memory ancestralOrigin, string memory steward, string memory emotionalTag) external onlyAdmin {
        entries.push(RecipeEntry(recipeName, ancestralOrigin, steward, emotionalTag, true, false, false));
    }

    function protectRecipe(uint256 index) external onlyAdmin {
        entries[index].protected = true;
    }

    function sealRecipe(uint256 index) external onlyAdmin {
        require(entries[index].protected, "Must be protected first");
        entries[index].sealed = true;
    }

    function getRecipeEntry(uint256 index) external view returns (RecipeEntry memory) {
        return entries[index];
    }
}
