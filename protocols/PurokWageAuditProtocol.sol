// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PurokWageAuditProtocol {
    address public admin;

    struct AuditEntry {
        string purokID;
        string sector;
        string auditType;
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

    function summonAudit(string memory purokID, string memory sector, string memory auditType, string memory emotionalTag) external onlyAdmin {
        entries.push(AuditEntry(purokID, sector, auditType, emotionalTag, true, false, false));
    }

    function confirmAudit(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function sealAudit(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getAuditEntry(uint256 index) external view returns (AuditEntry memory) {
        return entries[index];
    }
}
