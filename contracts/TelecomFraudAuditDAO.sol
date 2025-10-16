// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TelecomFraudAuditDAO {
    address public admin;

    struct AuditEntry {
        string operationName;
        string country;
        string fraudType; // e.g., "SMS phishing", "crypto laundering"
        string emotionalTag;
        bool audited;
        bool exposed;
    }

    AuditEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logAudit(string memory operationName, string memory country, string memory fraudType, string memory emotionalTag) external onlyAdmin {
        entries.push(AuditEntry(operationName, country, fraudType, emotionalTag, true, false));
    }

    function exposeFraud(uint256 index) external onlyAdmin {
        entries[index].exposed = true;
    }

    function getAudit(uint256 index) external view returns (AuditEntry memory) {
        return entries[index];
    }
}
