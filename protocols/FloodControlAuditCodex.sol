// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FloodControlAuditCodex {
    address public admin;

    struct AuditEntry {
        string projectName;
        string region;
        string riskClause;
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

    function summonAudit(string memory projectName, string memory region, string memory riskClause, string memory emotionalTag) external onlyAdmin {
        entries.push(AuditEntry(projectName, region, riskClause, emotionalTag, true, false, false));
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
