// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract WageProtectionProtocolDAO {
    address public steward;

    struct WageEvent {
        string companyName;
        string region;
        string disasterType; // "Earthquake", "Flood", "Landslide"
        string wageStatus; // "Paid", "Delayed", "Suspended", "Restored"
        string emotionalTag;
        uint256 timestamp;
    }

    WageEvent[] public events;

    event WageLogged(
        string companyName,
        string region,
        string disasterType,
        string wageStatus,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log wage protection rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logWage(
        string memory companyName,
        string memory region,
        string memory disasterType,
        string memory wageStatus,
        string memory emotionalTag
    ) external onlySteward {
        events.push(WageEvent({
            companyName: companyName,
            region: region,
            disasterType: disasterType,
            wageStatus: wageStatus,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit WageLogged(companyName, region, disasterType, wageStatus, emotionalTag, block.timestamp);
    }

    function getWageByIndex(uint256 index) external view returns (
        string memory companyName,
        string memory region,
        string memory disasterType,
        string memory wageStatus,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        WageEvent memory w = events[index];
        return (
            w.companyName,
            w.region,
            w.disasterType,
            w.wageStatus,
            w.emotionalTag,
