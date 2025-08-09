// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title ICEAudit - Tracks ICE behavior and civic alignment
contract ICEAudit {
    address public scrollsmith;
    struct AuditEntry {
        uint256 timestamp;
        string behavior;
        string outcome;
    }

    AuditEntry[] public auditLog;
    event BehaviorLogged(string behavior, string outcome);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not authorized.");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    function logBehavior(string memory behavior, string memory outcome) public onlyScrollsmith {
        auditLog.push(AuditEntry(block.timestamp, behavior, outcome));
        emit BehaviorLogged(behavior, outcome);
    }

    function getAuditLog() public view returns (AuditEntry[] memory) {
        return auditLog;
    }
}
