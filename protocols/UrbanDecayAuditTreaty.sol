// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UrbanDecayAuditTreaty {
    address public steward;

    struct AuditClause {
        string location;
        string decayType;
        string auditDirective;
        string emotionalTag;
    }

    AuditClause[] public treatyLog;

    event UrbanDecayAuditTagged(string location, string decayType, string auditDirective, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagAudit(
        string memory location,
        string memory decayType,
        string memory auditDirective,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(AuditClause(location, decayType, auditDirective, emotionalTag));
        emit UrbanDecayAuditTagged(location, decayType, auditDirective, emotionalTag);
    }
}
