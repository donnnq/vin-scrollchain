// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BudgetReversalImmunityPack {
    address public admin;

    struct ReversalEntry {
        string fundLabel;
        string reversalReason;
        string emotionalTag;
        bool returned;
        bool immunized;
    }

    ReversalEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitReversal(string memory fundLabel, string memory reversalReason, string memory emotionalTag) external onlyAdmin {
        entries.push(ReversalEntry(fundLabel, reversalReason, emotionalTag, false, false));
    }

    function markReturned(uint256 index) external onlyAdmin {
        entries[index].returned = true;
    }

    function grantImmunity(uint256 index) external onlyAdmin {
        entries[index].immunized = true;
    }

    function getEntry(uint256 index) external view returns (ReversalEntry memory) {
        return entries[index];
    }
}
