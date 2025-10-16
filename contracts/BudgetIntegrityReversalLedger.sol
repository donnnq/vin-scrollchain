// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BudgetIntegrityReversalLedger {
    address public admin;

    struct ReversalEntry {
        string fundLabel;
        string reversalTrigger;
        string emotionalTag;
        bool reversed;
        bool archived;
    }

    ReversalEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitReversal(string memory fundLabel, string memory reversalTrigger, string memory emotionalTag) external onlyAdmin {
        entries.push(ReversalEntry(fundLabel, reversalTrigger, emotionalTag, false, false));
    }

    function markReversed(uint256 index) external onlyAdmin {
        entries[index].reversed = true;
    }

    function archiveReversal(uint256 index) external onlyAdmin {
        entries[index].archived = true;
    }

    function getEntry(uint256 index) external view returns (ReversalEntry memory) {
        return entries[index];
    }
}
