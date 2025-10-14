// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AncestralKitchenProtocolDAO {
    address public admin;

    struct Kitchen {
        string name;
        string lineage;
        bool protected;
        string preservationMethod;
    }

    Kitchen[] public kitchens;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function registerKitchen(string memory _name, string memory _lineage, string memory _preservationMethod) external onlyAdmin {
        kitchens.push(Kitchen(_name, _lineage, false, _preservationMethod));
    }

    function activateProtection(uint256 index) external onlyAdmin {
        kitchens[index].protected = true;
    }

    function getKitchen(uint256 index) external view returns (Kitchen memory) {
        return kitchens[index];
    }
}
