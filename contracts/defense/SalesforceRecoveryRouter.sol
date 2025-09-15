// SPDX-License-Identifier: RecoverySanctum
pragma solidity ^0.8.19;

contract SalesforceRecoveryRouter {
    struct Recovery {
        string integrationName;
        bool reauthenticated;
        bool tokenRevoked;
        bool dataAuditCompleted;
    }

    mapping(address => Recovery) public recoveries;

    event RecoveryStarted(address indexed steward, string integrationName);
    event TokenRevoked(address indexed steward);
    event Reauthenticated(address indexed steward);
    event AuditCompleted(address indexed steward);

    function startRecovery(string memory integrationName) public {
        recoveries[msg.sender] = Recovery(integrationName, false, false, false);
        emit RecoveryStarted(msg.sender, integrationName);
    }

    function revokeToken(address steward) public {
        recoveries[steward].tokenRevoked = true;
        emit TokenRevoked(steward);
    }

    function reauthenticate(address steward) public {
        recoveries[steward].reauthenticated = true;
        emit Reauthenticated(steward);
    }

    function completeAudit(address steward) public {
        recoveries[steward].dataAuditCompleted = true;
        emit AuditCompleted(steward);
    }

    function getRecoveryStatus(address steward) public view returns (Recovery memory) {
        return recoveries[steward];
    }
}
