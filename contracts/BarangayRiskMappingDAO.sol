// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract BarangayRiskMappingDAO {
    address public steward;

    struct RiskEvent {
        string barangayName; // "Bangkal", "Tikay", "Longos"
        string riskType; // "Faultline", "Flood Zone", "Landslide Corridor"
        string mappingStatus; // "Mapped", "Pending", "Under Review"
        string emotionalTag;
        uint256 timestamp;
    }

    RiskEvent[] public events;

    event RiskLogged(
        string barangayName,
        string riskType,
        string mappingStatus,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only Vinvin may log barangay risk rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logRisk(
        string memory barangayName,
        string memory riskType,
        string memory mappingStatus,
        string memory emotionalTag
    ) external onlySteward {
        events.push(RiskEvent({
            barangayName: barangayName,
            riskType: riskType,
            mappingStatus: mappingStatus,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit RiskLogged(barangayName, riskType, mappingStatus, emotionalTag, block.timestamp);
    }
}
