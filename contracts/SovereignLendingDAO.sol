// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SovereignLendingDAO {
    address public admin;

    struct LendingEntry {
        string borrowerNation;
        string lendingClause;
        string emotionalTag;
        bool approved;
    }

    LendingEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory borrowerNation, string memory lendingClause, string memory emotionalTag) external onlyAdmin {
        entries.push(LendingEntry(borrowerNation, lendingClause, emotionalTag, false));
    }

    function approveEntry(uint256 index) external onlyAdmin {
        entries[index].approved = true;
    }

    function getEntry(uint256 index) external view returns (LendingEntry memory) {
        return entries[index];
    }
}
