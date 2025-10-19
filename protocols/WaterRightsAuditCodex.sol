// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WaterRightsAuditCodex {
    address public admin;

    struct AuditEntry {
        string farmName;
        string waterSource;
        string auditClause;
        string emotionalTag;
        bool summoned;
        bool inspected;
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

    function summonAudit(string memory farmName, string memory waterSource, string memory auditClause, string memory emotionalTag) external onlyAdmin {
        entries.push(AuditEntry(farmName, waterSource, auditClause, emotionalTag, true, false, false));
    }

    function confirmInspection(uint256 index) external onlyAdmin {
        entries[index].inspected = true;
    }

    function sealAuditEntry(uint256 index) external onlyAdmin {
        require(entries[index].inspected, "Must be inspected first");
        entries[index].sealed = true;
    }

    function getAuditEntry(uint256 index) external view returns (AuditEntry memory) {
        return entries[index];
    }
}
