// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BudgetInsertionAuditDAO {
    address public admin;

    struct InsertionEntry {
        string agencyLabel;
        string insertionDetail;
        string emotionalTag;
        bool flagged;
        bool reversed;
    }

    InsertionEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitInsertion(string memory agencyLabel, string memory insertionDetail, string memory emotionalTag) external onlyAdmin {
        entries.push(InsertionEntry(agencyLabel, insertionDetail, emotionalTag, false, false));
    }

    function flagInsertion(uint256 index) external onlyAdmin {
        entries[index].flagged = true;
    }

    function reverseInsertion(uint256 index) external onlyAdmin {
        entries[index].reversed = true;
    }

    function getInsertion(uint256 index) external view returns (InsertionEntry memory) {
        return entries[index];
    }
}
