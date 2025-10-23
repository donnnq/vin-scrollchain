// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayHubExpansionBlueprint {
    address public steward;

    struct ExpansionEntry {
        string barangayName;
        string purokTarget; // "Purok 1", "Purok 7", "Northville Zone"
        string expansionSignal; // "Hub replication", "Equipment delivery", "Livelihood onboarding"
        string emotionalTag;
        bool expanded;
        bool sealed;
    }

    ExpansionEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function expandHub(string memory barangayName, string memory purokTarget, string memory expansionSignal, string memory emotionalTag) external onlySteward {
        entries.push(ExpansionEntry(barangayName, purokTarget, expansionSignal, emotionalTag, true, false));
    }

    function sealExpansionEntry(uint256 index) external onlySteward {
        require(entries[index].expanded, "Must be expanded first");
        entries[index].sealed = true;
    }

    function getExpansionEntry(uint256 index) external view returns (ExpansionEntry memory) {
        return entries[index];
    }
}
