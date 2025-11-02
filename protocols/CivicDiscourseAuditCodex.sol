// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CivicDiscourseAuditCodex {
    address public steward;

    struct AuditClause {
        string corridor;
        string discourseType;
        string auditConcern;
        string emotionalTag;
    }

    AuditClause[] public codex;

    event DiscourseAudited(string corridor, string discourseType, string auditConcern, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function auditDiscourse(
        string memory corridor,
        string memory discourseType,
        string memory auditConcern,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(AuditClause(corridor, discourseType, auditConcern, emotionalTag));
        emit DiscourseAudited(corridor, discourseType, auditConcern, emotionalTag);
    }
}
