// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract TINSubmissionAuditRegistryDAO {
    address public steward;

    struct AuditEvent {
        string coopName;
        uint256 memberCount;
        uint256 TINsSubmitted;
        string auditStatus; // "Compliant", "Incomplete", "Flagged"
        string emotionalTag;
        uint256 timestamp;
    }

    AuditEvent[] public events;

    event AuditLogged(
        string coopName,
        uint256 memberCount,
        uint256 TINsSubmitted,
        string auditStatus,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log TIN audit rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logAudit(
        string memory coopName,
        uint256 memberCount,
        uint256 TINsSubmitted,
        string memory auditStatus,
        string memory emotionalTag
    ) external onlySteward {
        events.push(AuditEvent({
            coopName: coopName,
            memberCount: memberCount,
            TINsSubmitted: TINsSubmitted,
            auditStatus: auditStatus,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit AuditLogged(coopName, memberCount, TINsSubmitted, auditStatus, emotionalTag, block.timestamp);
    }

    function getAuditByIndex(uint256 index) external view returns (
        string memory coopName,
        uint256 memberCount,
        uint256 TINsSubmitted,
        string memory auditStatus,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        AuditEvent memory a = events[index];
        return (
            a.coopName,
            a.memberCount,
            a.TINsSubmitted,
            a.auditStatus,
            a.emotionalTag,
            a.timestamp
        );
    }
}
