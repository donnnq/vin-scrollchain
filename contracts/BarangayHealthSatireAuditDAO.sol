// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract BarangayHealthSatireAuditDAO {
    address public steward;

    struct SatireEvent {
        string satireTitle;
        string frontlineRole; // "Barangay Nurse", "Midwife", "Health Volunteer"
        string satireType; // "Mock Hotline", "Animated Thread", "Parody PSA"
        string auditVerdict; // "Flagged", "Amplified", "Exempted"
        string emotionalTag;
        uint256 timestamp;
    }

    SatireEvent[] public events;

    event SatireLogged(
        string satireTitle,
        string frontlineRole,
        string satireType,
        string auditVerdict,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log barangay health satire audits");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logSatire(
        string memory satireTitle,
        string memory frontlineRole,
        string memory satireType,
        string memory auditVerdict,
        string memory emotionalTag
    ) external onlySteward {
        events.push(SatireEvent({
            satireTitle: satireTitle,
            frontlineRole: frontlineRole,
            satireType: satireType,
            auditVerdict: auditVerdict,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit SatireLogged(satireTitle, frontlineRole, satireType, auditVerdict, emotionalTag, block.timestamp);
    }

    function getSatireByIndex(uint256 index) external view returns (
        string memory satireTitle,
        string memory frontlineRole,
        string memory satireType,
        string memory auditVerdict,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        SatireEvent memory s = events[index];
        return (
            s.satireTitle,
            s.frontlineRole,
            s.satireType,
            s.auditVerdict,
            s.emotionalTag,
            s.timestamp
        );
    }
}
