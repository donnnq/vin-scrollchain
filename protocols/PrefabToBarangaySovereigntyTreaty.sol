// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PrefabToBarangaySovereigntyTreaty {
    address public steward;

    struct SovereigntyEntry {
        string barangayName; // "Brgy. Bangkal Northville 8"
        string prefabType; // "Container apartment", "Modular dorm", "Scrollchain shelter"
        string treatyMethod; // "Community vote", "LGU zoning", "Scrollchain ratification"
        string emotionalTag;
        bool ratified;
        bool sealed;
    }

    SovereigntyEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function ratifyTreaty(string memory barangayName, string memory prefabType, string memory treatyMethod, string memory emotionalTag) external onlySteward {
        entries.push(SovereigntyEntry(barangayName, prefabType, treatyMethod, emotionalTag, true, false));
    }

    function sealSovereigntyEntry(uint256 index) external onlySteward {
        require(entries[index].ratified, "Must be ratified first");
        entries[index].sealed = true;
    }

    function getSovereigntyEntry(uint256 index) external view returns (SovereigntyEntry memory) {
        return entries[index];
    }
}
