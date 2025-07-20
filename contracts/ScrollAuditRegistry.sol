// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ScrollAuditRegistry {
    address public scrollkeeper;

    struct AuditEntry {
        string mixerName;
        string auditLink;
        string finding;
        string severity;
        string remediation;
        uint256 timestamp;
    }

    AuditEntry[] public auditLog;

    event AuditLogged(
        string mixerName,
        string severity,
        uint256 indexed timestamp
    );

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Not authorized");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    function logAudit(
        string calldata mixerName,
        string calldata auditLink,
        string calldata finding,
        string calldata severity,
        string calldata remediation
    ) external onlyScrollkeeper {
        auditLog.push(AuditEntry({
            mixerName: mixerName,
            auditLink: auditLink,
            finding: finding,
            severity: severity,
            remediation: remediation,
            timestamp: block.timestamp
        }));

        emit AuditLogged(mixerName, severity, block.timestamp);
    }

    function getAudit(uint256 index) external view returns (AuditEntry memory) {
        require(index < auditLog.length, "Invalid index");
        return auditLog[index];
    }

    function totalAudits() external view returns (uint256) {
        return auditLog.length;
    }
}
