// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract BarangayHotlineSatireAuditCharterDAO {
    address public steward;

    struct AuditEvent {
        string barangayName;
        string hotlineFunction; // "Evacuation", "Medical Aid", "Food Distribution"
        string satireType; // "Mock Call Center", "Animated Thread", "Parody PSA"
        string auditVerdict; // "Flagged", "Amplified", "Exempted"
        string emotionalTag;
        uint256 timestamp;
    }

    AuditEvent[] public events;

    event AuditLogged(
        string barangayName,
        string hotlineFunction,
        string satireType,
        string auditVerdict,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log barangay hotline satire audits");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logAudit(
        string memory barangayName,
        string memory hotlineFunction,
        string memory satireType,
        string memory auditVerdict,
        string memory emotionalTag
    ) external onlySteward {
        events.push(AuditEvent({
            barangayName: barangayName,
            hotlineFunction: hotlineFunction,
            satireType: satireType,
            auditVerdict: auditVerdict,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit AuditLogged(barangayName, hotlineFunction, satireType, auditVerdict, emotionalTag, block.timestamp);
    }

    function getAuditByIndex(uint256 index) external view returns (
        string memory barangayName,
        string memory hotlineFunction,
        string memory satireType,
        string memory auditVerdict,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        AuditEvent memory a = events[index];
        return (
            a.barangayName,
            a.hotlineFunction,
            a.satireType,
            a.auditVerdict,
            a.emotionalTag,
            a.timestamp
        );
    }
}
