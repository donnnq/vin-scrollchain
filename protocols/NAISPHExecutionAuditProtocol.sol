// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NAISPHExecutionAuditProtocol {
    address public steward;

    struct AuditEntry {
        string agencyName;
        string rolloutStatus;
        string budgetUtilization;
        string emotionalTag;
    }

    AuditEntry[] public protocol;

    event NAISPHAuditTagged(string agencyName, string rolloutStatus, string budgetUtilization, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagAudit(
        string memory agencyName,
        string memory rolloutStatus,
        string memory budgetUtilization,
        string memory emotionalTag
    ) public onlySteward {
        protocol.push(AuditEntry(agencyName, rolloutStatus, budgetUtilization, emotionalTag));
        emit NAISPHAuditTagged(agencyName, rolloutStatus, budgetUtilization, emotionalTag);
    }
}
