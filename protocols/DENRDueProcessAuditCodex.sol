// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DENRDueProcessAuditCodex {
    address public steward;

    struct AuditClause {
        string officeLocation;
        string violationType;
        string auditMechanism;
        string emotionalTag;
    }

    AuditClause[] public codex;

    event DueProcessViolationAudited(string officeLocation, string violationType, string auditMechanism, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function auditViolation(
        string memory officeLocation,
        string memory violationType,
        string memory auditMechanism,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(AuditClause(officeLocation, violationType, auditMechanism, emotionalTag));
        emit DueProcessViolationAudited(officeLocation, violationType, auditMechanism, emotionalTag);
    }
}
