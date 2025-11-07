// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TaxTransparencyAuditDAO {
    address public steward;

    struct AuditEntry {
        string timestamp;
        string taxType;
        string allocationTarget;
        string publicDisclosureLevel;
        string emotionalTag;
    }

    AuditEntry[] public registry;

    event TaxTransparencyAudited(string timestamp, string taxType, string allocationTarget, string publicDisclosureLevel, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function auditTax(
        string memory timestamp,
        string memory taxType,
        string memory allocationTarget,
        string memory publicDisclosureLevel,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(AuditEntry(timestamp, taxType, allocationTarget, publicDisclosureLevel, emotionalTag));
        emit TaxTransparencyAudited(timestamp, taxType, allocationTarget, publicDisclosureLevel, emotionalTag);
    }
}
