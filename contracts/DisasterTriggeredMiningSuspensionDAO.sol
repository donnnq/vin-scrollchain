// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract DisasterTriggeredMiningSuspensionDAO {
    address public steward;

    struct SuspensionEvent {
        string companyName;
        string region;
        string disasterType; // "Earthquake", "Flood", "Landslide"
        string status; // "Suspended", "Awaiting Clearance", "Resumed"
        string emotionalTag;
        uint256 timestamp;
    }

    SuspensionEvent[] public events;

    event SuspensionLogged(
        string companyName,
        string region,
        string disasterType,
        string status,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log mining suspension rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logSuspension(
        string memory companyName,
        string memory region,
        string memory disasterType,
        string memory status,
        string memory emotionalTag
    ) external onlySteward {
        events.push(SuspensionEvent({
            companyName: companyName,
            region: region,
            disasterType: disasterType,
            status: status,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit SuspensionLogged(companyName, region, disasterType, status, emotionalTag, block.timestamp);
    }

    function getSuspensionByIndex(uint256 index) external view returns (
        string memory companyName,
        string memory region,
        string memory disasterType,
        string memory status,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        SuspensionEvent memory s = events[index];
        return (
            s.companyName,
            s.region,
            s.disasterType,
            s.status,
            s.emotionalTag,
            s.timestamp
        );
    }
}
