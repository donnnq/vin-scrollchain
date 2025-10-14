// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalRecipeDAO {
    address public admin;

    struct Recipe {
        string name;
        string originCountry;
        string ingredients;
        string preparation;
        bool registered;
    }

    Recipe[] public recipes;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function registerRecipe(string memory _name, string memory _originCountry, string memory _ingredients, string memory _preparation) external onlyAdmin {
        recipes.push(Recipe(_name, _originCountry, _ingredients, _preparation, true));
    }

    function getRecipe(uint256 index) external view returns (Recipe memory) {
        return recipes[index];
    }
}
