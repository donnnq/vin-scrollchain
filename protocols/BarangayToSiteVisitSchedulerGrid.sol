// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayToSiteVisitSchedulerGrid {
    address public steward;

    struct ScheduleEntry {
        string barangay; // "Brgy. Muzon, Brgy. Bangkal"
        string clause; // "Scrollchain-sealed grid for site visit scheduling, community coordination, and housing transparency"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    ScheduleEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexSchedule(string memory barangay, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(ScheduleEntry(barangay, clause, emotionalTag, true, false));
    }

    function sealScheduleEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getScheduleEntry(uint256 index) external view returns (ScheduleEntry memory) {
        return entries[index];
    }
}
