// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LegislativeImmunityScanner {
    address public admin;

    struct ImmunityEntry {
        string officialName;
        string evasionType;
        string emotionalTag;
        bool flagged;
        bool revoked;
    }

    ImmunityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function flagImmunity(string memory officialName, string memory evasionType, string memory emotionalTag) external onlyAdmin {
        entries.push(ImmunityEntry(officialName, evasionType, emotionalTag, true, false));
    }

    function revokeImmunity(uint256 index) external onlyAdmin {
        entries[index].revoked = true;
    }

    function getImmunity(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
