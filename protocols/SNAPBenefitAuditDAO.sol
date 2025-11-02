// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SNAPBenefitAuditDAO {
    address public steward;

    struct BenefitAudit {
        string rulingAuthority;
        string affectedGroup;
        string auditOutcome;
        string emotionalTag;
    }

    BenefitAudit[] public registry;

    event SNAPBenefitAudited(string rulingAuthority, string affectedGroup, string auditOutcome, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function auditSNAPBenefit(
        string memory rulingAuthority,
        string memory affectedGroup,
        string memory auditOutcome,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(BenefitAudit(rulingAuthority, affectedGroup, auditOutcome, emotionalTag));
        emit SNAPBenefitAudited(rulingAuthority, affectedGroup, auditOutcome, emotionalTag);
    }
}
