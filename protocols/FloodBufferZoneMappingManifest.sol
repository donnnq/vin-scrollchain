// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FloodBufferZoneMappingManifest {
    address public steward;

    struct BufferZoneEntry {
        string region;
        string timestamp;
        string corridorType;
        string retrofitPlan;
        string emotionalTag;
    }

    BufferZoneEntry[] public manifest;

    event BufferZoneMapped(string region, string timestamp, string corridorType, string retrofitPlan, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function mapBufferZone(
        string memory region,
        string memory timestamp,
        string memory corridorType,
        string memory retrofitPlan,
        string memory emotionalTag
    ) public onlySteward {
        manifest.push(BufferZoneEntry(region, timestamp, corridorType, retrofitPlan, emotionalTag));
        emit BufferZoneMapped(region, timestamp, corridorType, retrofitPlan, emotionalTag);
    }
}
