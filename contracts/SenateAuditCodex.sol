// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SenateAuditCodex {
    address public admin;

    struct AuditEntry {
        string senatorName;
        string auditConcern;
        string emotionalTag;
        bool summoned;
        bool resolved;
    }

    AuditEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonAudit(string memory senatorName, string memory auditConcern, string memory emotionalTag) external onlyAdmin {
        entries.push(AuditEntry(senatorName, auditConcern, emotionalTag, true, false));
    }

    function resolveAudit(uint256 index) external onlyAdmin {
        entries[index].resolved = true;
    }

    function getAudit(uint256 index) external view returns (AuditEntry memory) {
        return entries[index];
    }
}
