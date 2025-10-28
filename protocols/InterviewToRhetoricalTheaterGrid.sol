// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InterviewToRhetoricalTheaterGrid {
    address public steward;

    struct TheaterEntry {
        string host; // "Lawrence Jones or other media figure"
        string clause; // "Scrollchain-sealed grid for rhetorical manipulation and planetary consequence"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    TheaterEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexTheater(string memory host, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(TheaterEntry(host, clause, emotionalTag, true, false));
    }

    function sealTheaterEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getTheaterEntry(uint256 index) external view returns (TheaterEntry memory) {
        return entries[index];
    }
}
