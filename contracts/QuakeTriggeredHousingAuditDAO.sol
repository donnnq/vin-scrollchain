// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract QuakeTriggeredHousingAuditDAO {
    address public steward;

    struct HousingAudit {
        string purok;
        string structureType; // "Residential", "Dormitory", "Barracks"
        string quakeMagnitude;
        string auditStatus; // "Cleared", "Flagged", "Unsafe"
        string emotionalTag;
        uint256 timestamp;
    }

    HousingAudit[] public audits;

    event HousingLogged(
        string purok,
        string structureType,
        string quakeMagnitude,
        string auditStatus,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log housing audit rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logHousing(
        string memory purok,
        string memory structureType,
        string memory quakeMagnitude,
        string memory auditStatus,
        string memory emotionalTag
    ) external onlySteward {
        audits.push(HousingAudit({
            purok: purok,
            structureType: structureType,
            quakeMagnitude: quakeMagnitude,
            auditStatus: auditStatus,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit HousingLogged(purok, structureType, quakeMagnitude, auditStatus, emotionalTag, block.timestamp);
    }

    function getHousingByIndex(uint256 index) external view returns (
        string memory purok,
        string memory structureType,
        string memory quakeMagnitude,
        string memory auditStatus,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < audits.length, "Scrollstorm index out of bounds");
        HousingAudit memory h = audits[index];
        return (
            h.purok,
            h.structureType,
            h.quakeMagnitude,
            h.auditStatus,
            h.emotionalTag,
            h.timestamp
        );
    }
}
