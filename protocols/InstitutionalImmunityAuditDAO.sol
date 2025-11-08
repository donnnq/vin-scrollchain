// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InstitutionalImmunityAuditDAO {
    address public steward;

    struct AuditEntry {
        string timestamp;
        string institutionName;
        string immunityClaimType;
        string legalBasis;
        string accountabilityGapSignal;
        string emotionalTag;
    }

    AuditEntry[] public registry;

    event ImmunityAudited(string timestamp, string institutionName, string immunityClaimType, string legalBasis, string accountabilityGapSignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function auditImmunity(
        string memory timestamp,
        string memory institutionName,
        string memory immunityClaimType,
        string memory legalBasis,
        string memory accountabilityGapSignal,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(AuditEntry(timestamp, institutionName, immunityClaimType, legalBasis, accountabilityGapSignal, emotionalTag));
        emit ImmunityAudited(timestamp, institutionName, immunityClaimType, legalBasis, accountabilityGapSignal, emotionalTag);
    }
}
