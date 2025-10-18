// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DeveloperSanctumImmunityPack {
    address public admin;

    struct ImmunityEntry {
        string developerName;
        string affectedRegistry;
        string emotionalTag;
        bool protected;
        bool restored;
    }

    ImmunityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function protectDeveloper(string memory developerName, string memory affectedRegistry, string memory emotionalTag) external onlyAdmin {
        entries.push(ImmunityEntry(developerName, affectedRegistry, emotionalTag, true, false));
    }

    function restoreSanctum(uint256 index) external onlyAdmin {
        entries[index].restored = true;
    }

    function getImmunityEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
