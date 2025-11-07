// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayStormDrainMappingDAO {
    address public steward;

    struct DrainEntry {
        string barangay;
        string timestamp;
        string drainLocation;
        string blockageStatus;
        string emotionalTag;
    }

    DrainEntry[] public registry;

    event StormDrainMapped(string barangay, string timestamp, string drainLocation, string blockageStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function mapDrain(
        string memory barangay,
        string memory timestamp,
        string memory drainLocation,
        string memory blockageStatus,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(DrainEntry(barangay, timestamp, drainLocation, blockageStatus, emotionalTag));
        emit StormDrainMapped(barangay, timestamp, drainLocation, blockageStatus, emotionalTag);
    }
}
