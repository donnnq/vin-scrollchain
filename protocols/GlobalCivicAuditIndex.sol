// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalCivicAuditIndex {
    address public admin;

    struct AuditEntry {
        string country;
        string auditType; // "Infrastructure", "Policy", "Budget", "Broadcast"
        string indexClause;
        string emotionalTag;
        bool summoned;
        bool scored;
        bool sealed;
    }

    AuditEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonAudit(string memory country, string memory auditType, string memory indexClause, string memory emotionalTag) external onlyAdmin {
        entries.push(AuditEntry(country, auditType, indexClause, emotionalTag, true, false, false));
    }

    function confirmScoring(uint256 index) external onlyAdmin {
        entries[index].scored = true;
    }

    function sealAuditEntry(uint256 index) external onlyAdmin {
        require(entries[index].scored, "Must be scored first");
        entries[index].sealed = true;
    }

    function getAuditEntry(uint256 index) external view returns (AuditEntry memory) {
        return entries[index];
    }
}
