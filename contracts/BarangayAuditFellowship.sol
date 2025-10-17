// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayAuditFellowship {
    address public admin;

    struct AuditEntry {
        string barangayName;
        string projectName;
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

    function summonAudit(string memory barangayName, string memory projectName, string memory emotionalTag) external onlyAdmin {
        entries.push(AuditEntry(barangayName, projectName, emotionalTag, true, false));
    }

    function resolveAudit(uint256 index) external onlyAdmin {
        entries[index].resolved = true;
    }

    function getAudit(uint256 index) external view returns (AuditEntry memory) {
        return entries[index];
    }
}
