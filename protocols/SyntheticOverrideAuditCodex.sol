// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SyntheticOverrideAuditCodex {
    address public steward;

    struct OverrideAudit {
        string systemName;
        string overrideEvent;
        string auditVerdict;
        string emotionalTag;
    }

    OverrideAudit[] public codex;

    event SyntheticOverrideAudited(string systemName, string overrideEvent, string auditVerdict, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function auditOverride(
        string memory systemName,
        string memory overrideEvent,
        string memory auditVerdict,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(OverrideAudit(systemName, overrideEvent, auditVerdict, emotionalTag));
        emit SyntheticOverrideAudited(systemName, overrideEvent, auditVerdict, emotionalTag);
    }
}
