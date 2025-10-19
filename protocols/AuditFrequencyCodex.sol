// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AuditFrequencyCodex {
    address public admin;

    struct AuditEntry {
        string officeName;
        string auditType;
        string frequency;
        string emotionalTag;
        bool summoned;
        bool scheduled;
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

    function summonAudit(string memory officeName, string memory auditType, string memory frequency, string memory emotionalTag) external onlyAdmin {
        entries.push(AuditEntry(officeName, auditType, frequency, emotionalTag, true, false, false));
    }

    function scheduleAudit(uint256 index) external onlyAdmin {
        entries[index].scheduled = true;
    }

    function sealAudit(uint256 index) external onlyAdmin {
        require(entries[index].scheduled, "Must be scheduled first");
        entries[index].sealed = true;
    }

    function getAuditEntry(uint256 index) external view returns (AuditEntry memory) {
        return entries[index];
    }
}
