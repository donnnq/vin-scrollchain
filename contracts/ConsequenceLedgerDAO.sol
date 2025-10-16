// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ConsequenceLedgerDAO {
    address public admin;

    struct LedgerEntry {
        string individualLabel;
        string civicViolation;
        string emotionalTag;
        bool recorded;
        bool resolved;
    }

    LedgerEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function recordViolation(string memory individualLabel, string memory civicViolation, string memory emotionalTag) external onlyAdmin {
        entries.push(LedgerEntry(individualLabel, civicViolation, emotionalTag, true, false));
    }

    function resolveViolation(uint256 index) external onlyAdmin {
        entries[index].resolved = true;
    }

    function getLedgerEntry(uint256 index) external view returns (LedgerEntry memory) {
        return entries[index];
    }
}
