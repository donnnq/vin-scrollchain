// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EcoVesselAuditProtocol {
    address public admin;

    struct AuditEntry {
        string vesselName;
        string emissionStatus;
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

    function summonAudit(string memory vesselName, string memory emissionStatus, string memory auditClause, string memory emotionalTag) external onlyAdmin {
        entries.push(AuditEntry(vesselName, emissionStatus, auditClause, emotionalTag, true, false, false));
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
