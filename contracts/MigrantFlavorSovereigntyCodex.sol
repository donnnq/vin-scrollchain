// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MigrantFlavorSovereigntyCodex {
    address public admin;

    struct FlavorEntry {
        string dishName;
        string originCulture;
        string hostCity;
        string emotionalTag;
        bool registered;
        bool amplified;
    }

    FlavorEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function registerFlavor(string memory dishName, string memory originCulture, string memory hostCity, string memory emotionalTag) external onlyAdmin {
        entries.push(FlavorEntry(dishName, originCulture, hostCity, emotionalTag, true, false));
    }

    function amplifyFlavor(uint256 index) external onlyAdmin {
        entries[index].amplified = true;
    }

    function getFlavor(uint256 index) external view returns (FlavorEntry memory) {
        return entries[index];
    }
}
