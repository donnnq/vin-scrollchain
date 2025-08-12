// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinAuditTrail {
    struct AuditEntry {
        string projectName;
        uint256 budgetReleased;
        string contractor;
        bool completed;
        string anomalyNote;
        uint256 timestamp;
    }

    AuditEntry[] public auditEntries;

    event AuditLogged(string projectName, string contractor, bool completed);

    function logAudit(
        string memory _projectName,
        uint256 _budgetReleased,
        string memory _contractor,
        bool _completed,
        string memory _anomalyNote
    ) public {
        auditEntries.push(AuditEntry(_projectName, _budgetReleased, _contractor, _completed, _anomalyNote, block.timestamp));
        emit AuditLogged(_projectName, _contractor, _completed);
    }

    function getAuditEntry(uint256 index) public view returns (AuditEntry memory) {
        return auditEntries[index];
    }
}
