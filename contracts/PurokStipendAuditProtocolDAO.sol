// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract PurokStipendAuditProtocolDAO {
    address public steward;

    struct AuditEvent {
        string purokName;
        string stipendTrigger; // "Delayed Disbursement", "Untracked Funds", "Missing Ledger"
        uint256 amountFlagged;
        string auditStatus; // "Flagged", "Resolved", "Amplified"
        string emotionalTag;
        uint256 timestamp;
    }

    AuditEvent[] public events;

    event AuditLogged(
        string purokName,
        string stipendTrigger,
        uint256 amountFlagged,
        string auditStatus,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log purok stipend audits");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logAudit(
        string memory purokName,
        string memory stipendTrigger,
        uint256 amountFlagged,
        string memory auditStatus,
        string memory emotionalTag
    ) external onlySteward {
        events.push(AuditEvent({
            purokName: purokName,
            stipendTrigger: stipendTrigger,
            amountFlagged: amountFlagged,
            auditStatus: auditStatus,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit AuditLogged(purokName, stipendTrigger, amountFlagged, auditStatus, emotionalTag, block.timestamp);
    }

    function getAuditByIndex(uint256 index) external view returns (
        string memory purokName,
        string memory stipendTrigger,
        uint256 amountFlagged,
        string memory auditStatus,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        AuditEvent memory a = events[index];
        return (
            a.purokName,
            a.stipendTrigger,
            a.amountFlagged,
            a.auditStatus,
            a.emotionalTag,
            a.timestamp
        );
    }
}
