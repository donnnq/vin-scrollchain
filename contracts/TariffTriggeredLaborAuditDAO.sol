// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract TariffTriggeredLaborAuditDAO {
    address public steward;

    struct AuditEvent {
        string companyName;
        string affectedCountry;
        string tariffPolicy; // "Call Center Bill", "Tech Outsourcing Ban"
        string auditStatus; // "Initiated", "Cleared", "Flagged"
        string emotionalTag;
        uint256 timestamp;
    }

    AuditEvent[] public events;

    event AuditLogged(
        string companyName,
        string affectedCountry,
        string tariffPolicy,
        string auditStatus,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log tariff-triggered labor audits");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logAudit(
        string memory companyName,
        string memory affectedCountry,
        string memory tariffPolicy,
        string memory auditStatus,
        string memory emotionalTag
    ) external onlySteward {
        events.push(AuditEvent({
            companyName: companyName,
            affectedCountry: affectedCountry,
            tariffPolicy: tariffPolicy,
            auditStatus: auditStatus,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit AuditLogged(companyName, affectedCountry, tariffPolicy, auditStatus, emotionalTag, block.timestamp);
    }

    function getAuditByIndex(uint256 index) external view returns (
        string memory companyName,
        string memory affectedCountry,
        string memory tariffPolicy,
        string memory auditStatus,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        AuditEvent memory a = events[index];
        return (
            a.companyName,
            a.affectedCountry,
            a.tariffPolicy,
            a.auditStatus,
            a.emotionalTag,
            a.timestamp
        );
    }
}
