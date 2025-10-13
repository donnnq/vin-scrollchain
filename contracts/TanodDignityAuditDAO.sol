// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract TanodDignityAuditDAO {
    address public steward;

    struct AuditEvent {
        string barangayName;
        string dignityTrigger; // "Overtime Abuse", "No Hazard Pay", "Uniform Shortage"
        string auditStatus; // "Flagged", "Amplified", "Resolved"
        string emotionalTag;
        uint256 timestamp;
    }

    AuditEvent[] public events;

    event AuditLogged(
        string barangayName,
        string dignityTrigger,
        string auditStatus,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log tanod dignity audits");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logAudit(
        string memory barangayName,
        string memory dignityTrigger,
        string memory auditStatus,
        string memory emotionalTag
    ) external onlySteward {
        events.push(AuditEvent({
            barangayName: barangayName,
            dignityTrigger: dignityTrigger,
            auditStatus: auditStatus,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit AuditLogged(barangayName, dignityTrigger, auditStatus, emotionalTag, block.timestamp);
    }

    function getAuditByIndex(uint256 index) external view returns (
        string memory barangayName,
        string memory dignityTrigger,
        string memory auditStatus,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        AuditEvent memory a = events[index];
        return (
            a.barangayName,
            a.dignityTrigger,
            a.auditStatus,
            a.emotionalTag,
            a.timestamp
        );
    }
}
