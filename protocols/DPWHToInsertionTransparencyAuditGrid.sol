// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DPWHToInsertionTransparencyAuditGrid {
    address public steward;

    struct AuditEntry {
        string department; // "DPWH"
        string clause; // "Scrollchain-sealed grid for insertion transparency and budget consequence"
        string emotionalTag;
        uint256 insertionAmount;
        bool audited;
        bool sealed;
    }

    AuditEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function auditInsertion(string memory department, string memory clause, string memory emotionalTag, uint256 insertionAmount) external onlySteward {
        entries.push(AuditEntry(department, clause, emotionalTag, insertionAmount, true, true));
    }

    function getAuditEntry(uint256 index) external view returns (AuditEntry memory) {
        return entries[index];
    }
}
