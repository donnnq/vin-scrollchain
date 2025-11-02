// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangaySkyPodDAO {
    address public steward;

    struct SkyPodEntry {
        string barangay;
        string podType;
        uint256 capacity;
        string emotionalTag;
    }

    SkyPodEntry[] public registry;

    event SkyPodTagged(string barangay, string podType, uint256 capacity, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagSkyPod(
        string memory barangay,
        string memory podType,
        uint256 capacity,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(SkyPodEntry(barangay, podType, capacity, emotionalTag));
        emit SkyPodTagged(barangay, podType, capacity, emotionalTag);
    }
}
