// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract vinSpectralAudit {
    address public auditWarden;
    mapping(address => AuditLog[]) public entityLogs;

    struct AuditLog {
        uint256 timestamp;
        string actionType;
        string ritualNote;
    }

    event SpectralRecorded(address indexed entity, string actionType, string ritualNote);
    event AuditQuery(address indexed entity, uint256 logCount);

    modifier onlyWarden() {
        require(msg.sender == auditWarden, "Unauthorized spectral touch.");
        _;
    }

    constructor() {
        auditWarden = msg.sender;
    }

    function recordAction(address entity, string memory actionType, string memory ritualNote) external onlyWarden {
        entityLogs[entity].push(AuditLog(block.timestamp, actionType, ritualNote));
        emit SpectralRecorded(entity, actionType, ritualNote);
    }

    function queryAuditTrail(address entity) external view returns (AuditLog[] memory logs) {
        logs = entityLogs[entity];
        emit AuditQuery(entity, logs.length);
    }

    function getLastAction(address entity) external view returns (string memory actionType, string memory note, uint256 time) {
        uint256 len = entityLogs[entity].length;
        require(len > 0, "No spectral residue found.");
        AuditLog memory last = entityLogs[entity][len - 1];
        actionType = last.actionType;
        note = last.ritualNote;
        time = last.timestamp;
    }
}
