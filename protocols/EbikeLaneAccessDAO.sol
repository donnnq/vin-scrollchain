// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EbikeLaneAccessDAO {
    address public steward;

    struct LaneEntry {
        string barangay;
        string laneType;
        string signageStatus;
        string emotionalTag;
    }

    LaneEntry[] public registry;

    event EbikeLaneTagged(string barangay, string laneType, string signageStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagEbikeLane(
        string memory barangay,
        string memory laneType,
        string memory signageStatus,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(LaneEntry(barangay, laneType, signageStatus, emotionalTag));
        emit EbikeLaneTagged(barangay, laneType, signageStatus, emotionalTag);
    }
}
