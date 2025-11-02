// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EmployerComplianceDAO {
    address public steward;

    struct ComplianceEntry {
        string employerName;
        string auditStatus;
        string violationFlag;
        string emotionalTag;
    }

    ComplianceEntry[] public registry;

    event EmployerComplianceTagged(string employerName, string auditStatus, string violationFlag, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagEmployerCompliance(
        string memory employerName,
        string memory auditStatus,
        string memory violationFlag,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(ComplianceEntry(employerName, auditStatus, violationFlag, emotionalTag));
        emit EmployerComplianceTagged(employerName, auditStatus, violationFlag, emotionalTag);
    }
}
