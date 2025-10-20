// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TaxBurdenAuditCodex {
    address public admin;

    struct AuditEntry {
        string barangayName;
        string burdenType;
        string auditClause;
        string emotionalTag;
        bool summoned;
        bool audited;
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

    function summonAudit(string memory barangayName, string memory burdenType, string memory auditClause, string memory emotionalTag) external onlyAdmin {
        entries.push(AuditEntry(barangayName, burdenType, auditClause, emotionalTag, true, false, false));
    }

    function confirmAudit(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function sealAuditEntry(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getAuditEntry(uint256 index) external view returns (AuditEntry memory) {
        return entries[index];
    }
}
