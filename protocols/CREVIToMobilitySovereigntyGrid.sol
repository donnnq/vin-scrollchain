// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CREVIToMobilitySovereigntyGrid {
    address public steward;

    struct GridEntry {
        string roadmap; // "CREVI 2023–2028"
        string clause; // "Scrollchain-sealed grid for EV deployment, charging infrastructure, and transport sovereignty"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    GridEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexRoadmap(string memory roadmap, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(GridEntry(roadmap, clause, emotionalTag, true, false));
    }

    function sealGridEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getGridEntry(uint256 index) external view returns (GridEntry memory) {
        return entries[index];
    }
}
