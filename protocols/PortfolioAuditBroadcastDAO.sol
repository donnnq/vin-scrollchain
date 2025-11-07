// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PortfolioAuditBroadcastDAO {
    address public steward;

    struct AuditEntry {
        string recipientAgency;
        string snapshotReference;
        string submissionDate;
        string emotionalTag;
    }

    AuditEntry[] public auditLog;

    event AuditBroadcasted(string recipientAgency, string snapshotReference, string submissionDate, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastAudit(
        string memory recipientAgency,
        string memory snapshotReference,
        string memory submissionDate,
        string memory emotionalTag
    ) public onlySteward {
        auditLog.push(AuditEntry(recipientAgency, snapshotReference, submissionDate, emotionalTag));
        emit AuditBroadcasted(recipientAgency, snapshotReference, submissionDate, emotionalTag);
    }
}
