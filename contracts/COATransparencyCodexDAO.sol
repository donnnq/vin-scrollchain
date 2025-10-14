// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract COATransparencyCodexDAO {
    address public admin;

    struct AuditEntry {
        string projectName;
        string barangay;
        string fundAmount;
        string auditStatus;
        string emotionalTag;
        bool published;
    }

    AuditEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitAudit(string memory _projectName, string memory _barangay, string memory _fundAmount, string memory _auditStatus, string memory _emotionalTag) external onlyAdmin {
        entries.push(AuditEntry(_projectName, _barangay, _fundAmount, _auditStatus, _emotionalTag, false));
    }

    function publishAudit(uint256 index) external onlyAdmin {
        entries[index].published = true;
    }

    function getAudit(uint256 index) external view returns (AuditEntry memory) {
        return entries[index];
    }
}
