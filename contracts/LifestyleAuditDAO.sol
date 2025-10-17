// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LifestyleAuditDAO {
    address public admin;

    struct AuditEntry {
        string officialName;
        string auditFocus;
        string emotionalTag;
        bool summoned;
        bool completed;
    }

    AuditEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonAudit(string memory officialName, string memory auditFocus, string memory emotionalTag) external onlyAdmin {
        entries.push(AuditEntry(officialName, auditFocus, emotionalTag, true, false));
    }

    function completeAudit(uint256 index) external onlyAdmin {
        entries[index].completed = true;
    }

    function getAuditEntry(uint256 index) external view returns (AuditEntry memory) {
        return entries[index];
    }
}
