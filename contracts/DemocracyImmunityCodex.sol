// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DemocracyImmunityCodex {
    address public admin;

    struct ImmunityEntry {
        string institutionName;
        string threatType;
        string emotionalTag;
        bool flagged;
        bool immunized;
    }

    ImmunityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function flagThreat(string memory institutionName, string memory threatType, string memory emotionalTag) external onlyAdmin {
        entries.push(ImmunityEntry(institutionName, threatType, emotionalTag, true, false));
    }

    function immunizeInstitution(uint256 index) external onlyAdmin {
        entries[index].immunized = true;
    }

    function getImmunityEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
