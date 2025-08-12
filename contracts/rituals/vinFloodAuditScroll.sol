// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinFloodAuditScroll {
    struct MissingInfra {
        string projectName;
        string location;
        uint256 budgetPromised;
        bool wasBuilt;
        string notes;
    }

    mapping(uint256 => MissingInfra) public auditLog;
    uint256 public logCount;

    event AuditLogged(string projectName, string location, uint256 budgetPromised, bool wasBuilt);

    function logAudit(
        string memory _projectName,
        string memory _location,
        uint256 _budgetPromised,
        bool _wasBuilt,
        string memory _notes
    ) public {
        auditLog[logCount] = MissingInfra(_projectName, _location, _budgetPromised, _wasBuilt, _notes);
        emit AuditLogged(_projectName, _location, _budgetPromised, _wasBuilt);
        logCount++;
    }
}
