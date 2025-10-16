// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BudgetInsertionAuditDAO {
    address public admin;

    struct InsertionEntry {
        string sourceLabel;
        string fundPurpose;
        string emotionalTag;
        bool flagged;
        bool returned;
    }

    InsertionEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitInsertion(string memory sourceLabel, string memory fundPurpose, string memory emotionalTag) external onlyAdmin {
        entries.push(InsertionEntry(sourceLabel, fundPurpose, emotionalTag, false, false));
    }

    function flagInsertion(uint256 index) external onlyAdmin {
        entries[index].flagged = true;
    }

    function markReturned(uint256 index) external onlyAdmin {
        entries[index].returned = true;
    }

    function getEntry(uint256 index) external view returns (InsertionEntry memory) {
        return entries[index];
    }
}
