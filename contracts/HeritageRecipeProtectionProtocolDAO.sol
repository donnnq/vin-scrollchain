// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HeritageRecipeProtectionProtocolDAO {
    address public admin;

    struct Recipe {
        string name;
        string origin;
        bool protected;
        string preservationMethod;
    }

    Recipe[] public recipes;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function registerRecipe(string memory _name, string memory _origin, string memory _preservationMethod) external onlyAdmin {
        recipes.push(Recipe(_name, _origin, false, _preservationMethod));
    }

    function activateProtection(uint256 index) external onlyAdmin {
        recipes[index].protected = true;
    }

    function getRecipe(uint256 index) external view returns (Recipe memory) {
        return recipes[index];
    }
}
