// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EmployerImpunityAuditCodex {
    address public steward;

    struct AuditEntry {
        string employerName;
        string violationType;
        string impunityStatus;
        string emotionalTag;
    }

    AuditEntry[] public codex;

    event EmployerImpunityAudited(string employerName, string violationType, string impunityStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function auditImpunity(
        string memory employerName,
        string memory violationType,
        string memory impunityStatus,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(AuditEntry(employerName, violationType, impunityStatus, emotionalTag));
        emit EmployerImpunityAudited(employerName, violationType, impunityStatus, emotionalTag);
    }
}
