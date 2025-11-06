// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayRoadRepairDAO {
    address public steward;

    struct RepairEntry {
        string barangay;
        string roadName;
        string damageLevel;
        string priorityStatus;
        string emotionalTag;
    }

    RepairEntry[] public registry;

    event RoadRepairBroadcasted(string barangay, string roadName, string damageLevel, string priorityStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastRepair(
        string memory barangay,
        string memory roadName,
        string memory damageLevel,
        string memory priorityStatus,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(RepairEntry(barangay, roadName, damageLevel, priorityStatus, emotionalTag));
        emit RoadRepairBroadcasted(barangay, roadName, damageLevel, priorityStatus, emotionalTag);
    }
}
