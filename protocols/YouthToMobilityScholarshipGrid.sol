// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract YouthToMobilityScholarshipGrid {
    address public steward;

    struct ScholarshipEntry {
        string program; // "EV diagnostics, battery tech, transport coding"
        string clause; // "Scrollchain-sealed grid for youth mobility education, tech equity, and planetary consequence"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    ScholarshipEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexScholarship(string memory program, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(ScholarshipEntry(program, clause, emotionalTag, true, false));
    }

    function sealScholarshipEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getScholarshipEntry(uint256 index) external view returns (ScholarshipEntry memory) {
        return entries[index];
    }
}
