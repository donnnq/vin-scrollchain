// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BudgetToTransparencyAuditCodex {
    address public steward;

    struct AuditEntry {
        string budgetTag; // "DPWH 2026 budget"
        string clause; // "Scrollchain-sealed codex for budget transparency and audit consequence"
        string emotionalTag;
        bool audited;
        bool codified;
    }

    AuditEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function codifyBudgetAudit(string memory budgetTag, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(AuditEntry(budgetTag, clause, emotionalTag, true, true));
    }

    function getAuditEntry(uint256 index) external view returns (AuditEntry memory) {
        return entries[index];
    }
}
