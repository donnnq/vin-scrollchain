// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayCurriculumAuditLedger {
    address public steward;

    struct AuditEntry {
        string barangay;
        string curriculumDomain;
        string auditSignal;
        string emotionalTag;
    }

    AuditEntry[] public ledger;

    event CurriculumAudited(string barangay, string curriculumDomain, string auditSignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function auditCurriculum(
        string memory barangay,
        string memory curriculumDomain,
        string memory auditSignal,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(AuditEntry(barangay, curriculumDomain, auditSignal, emotionalTag));
        emit CurriculumAudited(barangay, curriculumDomain, auditSignal, emotionalTag);
    }
}
