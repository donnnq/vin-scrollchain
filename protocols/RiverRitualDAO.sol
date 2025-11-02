// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RiverRitualDAO {
    address public steward;

    struct RitualEntry {
        string riverLocation;
        string ritualType;
        string civicUse;
        string emotionalTag;
    }

    RitualEntry[] public registry;

    event RiverRitualTagged(string riverLocation, string ritualType, string civicUse, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagRitual(
        string memory riverLocation,
        string memory ritualType,
        string memory civicUse,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(RitualEntry(riverLocation, ritualType, civicUse, emotionalTag));
        emit RiverRitualTagged(riverLocation, ritualType, civicUse, emotionalTag);
    }
}
