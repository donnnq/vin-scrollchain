// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GhostProjectAuditCodex {
    address public admin;

    struct AuditEntry {
        string projectName;
        string barangayZone;
        string auditClause;
        string emotionalTag;
        bool summoned;
        bool validated;
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

    function summonAudit(string memory projectName, string memory barangayZone, string memory auditClause, string memory emotionalTag) external onlyAdmin {
        entries.push(AuditEntry(projectName, barangayZone, auditClause, emotionalTag, true, false, false));
    }

    function confirmValidation(uint256 index) external onlyAdmin {
        entries[index].validated = true;
    }

    function sealAuditEntry(uint256 index) external onlyAdmin {
        require(entries[index].validated, "Must be validated first");
        entries[index].sealed = true;
    }

    function getAuditEntry(uint256 index) external view returns (AuditEntry memory) {
        return entries[index];
    }
}
