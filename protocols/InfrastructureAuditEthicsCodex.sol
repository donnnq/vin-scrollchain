// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InfrastructureAuditEthicsCodex {
    address public steward;

    struct AuditClause {
        string projectName;
        string corridor;
        string auditConcern;
        string emotionalTag;
    }

    AuditClause[] public codex;

    event AuditTagged(string projectName, string corridor, string auditConcern, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagAudit(
        string memory projectName,
        string memory corridor,
        string memory auditConcern,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(AuditClause(projectName, corridor, auditConcern, emotionalTag));
        emit AuditTagged(projectName, corridor, auditConcern, emotionalTag);
    }
}
