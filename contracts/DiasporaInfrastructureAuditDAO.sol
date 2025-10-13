// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract DiasporaInfrastructureAuditDAO {
    address public steward;

    struct AuditEvent {
        string hostCountry;
        string FilipinoCommunity;
        string infrastructureType; // "Shelter", "Utilities", "Transit", "Digital Access"
        string auditStatus; // "Secured", "Flagged", "Under Review"
        string emotionalTag;
        uint256 timestamp;
    }

    AuditEvent[] public events;

    event AuditLogged(
        string hostCountry,
        string FilipinoCommunity,
        string infrastructureType,
        string auditStatus,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log diaspora infrastructure audits");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logAudit(
        string memory hostCountry,
        string memory FilipinoCommunity,
        string memory infrastructureType,
        string memory auditStatus,
        string memory emotionalTag
    ) external onlySteward {
        events.push(AuditEvent({
            hostCountry: hostCountry,
            FilipinoCommunity: FilipinoCommunity,
            infrastructureType: infrastructureType,
            auditStatus: auditStatus,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit AuditLogged(hostCountry, FilipinoCommunity, infrastructureType, auditStatus, emotionalTag, block.timestamp);
    }

    function getAuditByIndex(uint256 index) external view returns (
        string memory hostCountry,
        string memory FilipinoCommunity,
        string memory infrastructureType,
        string memory auditStatus,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        AuditEvent memory a = events[index];
        return (
            a.hostCountry,
            a.FilipinoCommunity,
            a.infrastructureType,
            a.auditStatus,
            a.emotionalTag,
            a.timestamp
        );
    }
}
