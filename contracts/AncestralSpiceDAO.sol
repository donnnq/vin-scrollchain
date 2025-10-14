// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AncestralSpiceDAO {
    address public admin;

    struct Spice {
        string name;
        string origin;
        string preservationMethod;
        bool protected;
    }

    Spice[] public spices;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function registerSpice(string memory _name, string memory _origin, string memory _preservationMethod) external onlyAdmin {
        spices.push(Spice(_name, _origin, _preservationMethod, false));
    }

    function activateProtection(uint256 index) external onlyAdmin {
        spices[index].protected = true;
    }

    function getSpice(uint256 index) external view returns (Spice memory) {
        return spices[index];
    }
}
