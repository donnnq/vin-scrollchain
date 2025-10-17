// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PurokNourishmentFellowship {
    address public admin;

    struct NourishmentEntry {
        string purokName;
        string dishName;
        string emotionalTag;
        bool initiated;
        bool protected;
    }

    NourishmentEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function initiateNourishment(string memory purokName, string memory dishName, string memory emotionalTag) external onlyAdmin {
        entries.push(NourishmentEntry(purokName, dishName, emotionalTag, true, false));
    }

    function protectNourishment(uint256 index) external onlyAdmin {
        entries[index].protected = true;
    }

    function getNourishment(uint256 index) external view returns (NourishmentEntry memory) {
        return entries[index];
    }
}
