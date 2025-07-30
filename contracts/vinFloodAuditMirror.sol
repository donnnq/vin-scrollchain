// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title vinFloodAuditMirror.sol
/// @notice Reflects ghost projects and verifies civic integrity on flood zones

contract vinFloodAuditMirror {
    address public mirrorBearer;

    struct AuditLog {
        string projectName;
        uint allocatedBudget;
        uint actualSpent;
        bool verified;
    }

    AuditLog[] public audits;

    event AuditLogged(string projectName, bool verified);

    constructor() {
        mirrorBearer = msg.sender;
    }

    modifier onlyBearer() {
        require(msg.sender == mirrorBearer, "Not bearer");
        _;
    }

    function logAudit(string memory projectName, uint allocatedBudget, uint actualSpent) public onlyBearer {
        bool verified = actualSpent >= (allocatedBudget * 80 / 100); // must be at least 80% used
        audits.push(AuditLog(projectName, allocatedBudget, actualSpent, verified));
        emit AuditLogged(projectName, verified);
    }

    function getAudit(uint index) public view returns (AuditLog memory) {
        require(index < audits.length, "Invalid audit");
        return audits[index];
    }
}
