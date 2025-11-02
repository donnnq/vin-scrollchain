// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayRetrenchmentAuditDAO {
    address public steward;

    struct RetrenchmentEntry {
        string employerName;
        string reason;
        string auditStatus;
        string emotionalTag;
    }

    RetrenchmentEntry[] public registry;

    event RetrenchmentAudited(string employerName, string reason, string auditStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function auditRetrenchment(
        string memory employerName,
        string memory reason,
        string memory auditStatus,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(RetrenchmentEntry(employerName, reason, auditStatus, emotionalTag));
        emit RetrenchmentAudited(employerName, reason, auditStatus, emotionalTag);
    }
}
