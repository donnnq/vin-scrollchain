// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SenateAuditFellowship {
    address public admin;

    struct AuditEntry {
        string senatorName;
        string auditTheme;
        string emotionalTag;
        bool initiated;
        bool reinforced;
    }

    AuditEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function initiateAudit(string memory senatorName, string memory auditTheme, string memory emotionalTag) external onlyAdmin {
        entries.push(AuditEntry(senatorName, auditTheme, emotionalTag, true, false));
    }

    function reinforceAudit(uint256 index) external onlyAdmin {
        entries[index].reinforced = true;
    }

    function getAudit(uint256 index) external view returns (AuditEntry memory) {
        return entries[index];
    }
}
