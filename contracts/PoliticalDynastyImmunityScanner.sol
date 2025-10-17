// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PoliticalDynastyImmunityScanner {
    address public admin;

    struct DynastyEntry {
        string familyName;
        string tacticUsed;
        string emotionalTag;
        bool flagged;
        bool immunized;
    }

    DynastyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function flagDynasty(string memory familyName, string memory tacticUsed, string memory emotionalTag) external onlyAdmin {
        entries.push(DynastyEntry(familyName, tacticUsed, emotionalTag, true, false));
    }

    function immunizeDynasty(uint256 index) external onlyAdmin {
        entries[index].immunized = true;
    }

    function getDynastyEntry(uint256 index) external view returns (DynastyEntry memory) {
        return entries[index];
    }
}
