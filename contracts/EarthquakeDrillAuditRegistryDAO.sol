// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract EarthquakeDrillAuditRegistryDAO {
    address public steward;

    struct DrillEvent {
        string schoolOrBarangay; // "Northville Academy", "Barangay Bangkal"
        string drillType; // "Drop-Cover-Hold", "Evacuation", "Simulation"
        string auditStatus; // "Completed", "Flagged", "Pending"
        string emotionalTag;
        uint256 timestamp;
    }

    DrillEvent[] public events;

    event DrillLogged(
        string schoolOrBarangay,
        string drillType,
        string auditStatus,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only Vinvin may log earthquake drill rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logDrill(
        string memory schoolOrBarangay,
        string memory drillType,
        string memory auditStatus,
        string memory emotionalTag
    ) external onlySteward {
        events.push(DrillEvent({
            schoolOrBarangay: schoolOrBarangay,
            drillType: drillType,
            auditStatus: auditStatus,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit DrillLogged(schoolOrBarangay, drillType, auditStatus, emotionalTag, block.timestamp);
    }
}
