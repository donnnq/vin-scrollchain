// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AncestralGatheringDAO {
    address public steward;

    struct GatheringEntry {
        string location;
        string ritualType;
        string communityGroup;
        string emotionalTag;
    }

    GatheringEntry[] public registry;

    event AncestralGatheringTagged(string location, string ritualType, string communityGroup, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagGathering(
        string memory location,
        string memory ritualType,
        string memory communityGroup,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(GatheringEntry(location, ritualType, communityGroup, emotionalTag));
        emit AncestralGatheringTagged(location, ritualType, communityGroup, emotionalTag);
    }
}
