// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract BarangayFaultlineRelocationDAO {
    address public steward;

    struct RelocationEvent {
        string barangayName; // "Bangkal", "Longos", "Tikay"
        string faultlineRisk; // "West Valley Fault", "Seismic Corridor"
        string relocationStatus; // "Proposed", "Funded", "In Progress"
        string emotionalTag;
        uint256 timestamp;
    }

    RelocationEvent[] public events;

    event RelocationLogged(
        string barangayName,
        string faultlineRisk,
        string relocationStatus,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only Vinvin may log faultline relocation rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logRelocation(
        string memory barangayName,
        string memory faultlineRisk,
        string memory relocationStatus,
        string memory emotionalTag
    ) external onlySteward {
        events.push(RelocationEvent({
            barangayName: barangayName,
            faultlineRisk: faultlineRisk,
            relocationStatus: relocationStatus,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit RelocationLogged(barangayName, faultlineRisk, relocationStatus, emotionalTag, block.timestamp);
    }
}
