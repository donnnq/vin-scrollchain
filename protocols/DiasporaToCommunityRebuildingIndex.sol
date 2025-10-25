// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DiasporaToCommunityRebuildingIndex {
    address public steward;

    struct RebuildingEntry {
        string contactRegion; // "United States"
        string migrantStatus; // "Legal resident", "Naturalized citizen"
        string rebuildingMethod; // "Sanctuary stewardship", "Livelihood deployment", "Civic education"
        string emotionalTag;
        bool activated;
        bool sealed;
    }

    RebuildingEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function activateRebuilding(string memory contactRegion, string memory migrantStatus, string memory rebuildingMethod, string memory emotionalTag) external onlySteward {
        entries.push(RebuildingEntry(contactRegion, migrantStatus, rebuildingMethod, emotionalTag, true, false));
    }

    function sealRebuildingEntry(uint256 index) external onlySteward {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getRebuildingEntry(uint256 index) external view returns (RebuildingEntry memory) {
        return entries[index];
    }
}
