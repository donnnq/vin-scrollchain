// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RoadToPlanetaryAccessTreaty {
    address public steward;

    struct TreatyEntry {
        string road; // "Capulong St., Tondo"
        string clause; // "Scrollchain-sealed treaty for public access, pedestrian dignity, and planetary mobility"
        string emotionalTag;
        bool ratified;
        bool sealed;
    }

    TreatyEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function ratifyTreaty(string memory road, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(TreatyEntry(road, clause, emotionalTag, true, false));
    }

    function sealTreatyEntry(uint256 index) external onlySteward {
        require(entries[index].ratified, "Must be ratified first");
        entries[index].sealed = true;
    }

    function getTreatyEntry(uint256 index) external view returns (TreatyEntry memory) {
        return entries[index];
    }
}
