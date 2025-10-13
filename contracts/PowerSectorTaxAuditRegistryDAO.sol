// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract PowerSectorTaxAuditRegistryDAO {
    address public steward;

    struct AuditEvent {
        string companyName;
        string taxType; // "VAT", "Excise", "Local Tax"
        uint256 taxAmount;
        string auditStatus; // "Flagged", "Resolved", "Amplified"
        string emotionalTag;
        uint256 timestamp;
    }

    AuditEvent[] public events;

    event AuditLogged(
        string companyName,
        string taxType,
        uint256 taxAmount,
        string auditStatus,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log power sector tax audits");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logAudit(
        string memory companyName,
        string memory taxType,
        uint256 taxAmount,
        string memory auditStatus,
        string memory emotionalTag
    ) external onlySteward {
        events.push(AuditEvent({
            companyName: companyName,
            taxType: taxType,
            taxAmount: taxAmount,
            auditStatus: auditStatus,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit AuditLogged(companyName, taxType, taxAmount, auditStatus, emotionalTag, block.timestamp);
    }

    function getAuditByIndex(uint256 index) external view returns (
        string memory companyName,
        string memory taxType,
        uint256 taxAmount,
        string memory auditStatus,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        AuditEvent memory a = events[index];
        return (
            a.companyName,
            a.taxType,
            a.taxAmount,
            a.auditStatus,
            a.emotionalTag,
            a.timestamp
        );
    }
}
