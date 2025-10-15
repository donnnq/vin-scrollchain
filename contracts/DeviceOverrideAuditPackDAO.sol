// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DeviceOverrideAuditPackDAO {
    address public admin;

    struct AuditEntry {
        string deviceID;
        string overrideType;
        string auditClause;
        string emotionalTag;
        bool verified;
    }

    AuditEntry[] public audits;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitAudit(string memory _deviceID, string memory _overrideType, string memory _auditClause, string memory _emotionalTag) external onlyAdmin {
        audits.push(AuditEntry(_deviceID, _overrideType, _auditClause, _emotionalTag, false));
    }

    function verifyAudit(uint256 index) external onlyAdmin {
        audits[index].verified = true;
    }

    function getAudit(uint256 index) external view returns (AuditEntry memory) {
        return audits[index];
    }
}
