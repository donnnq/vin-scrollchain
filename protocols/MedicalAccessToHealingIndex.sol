// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MedicalAccessToHealingIndex {
    address public steward;

    struct HealingEntry {
        string accessPoint; // "Mobile clinic", "Ghost city health hub"
        string healingType; // "Preventive care", "Mental health", "Emergency response"
        string targetGroup; // "Displaced families", "Elderly", "Children"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    HealingEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexHealing(string memory accessPoint, string memory healingType, string memory targetGroup, string memory emotionalTag) external onlySteward {
        entries.push(HealingEntry(accessPoint, healingType, targetGroup, emotionalTag, true, false));
    }

    function sealHealingEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getHealingEntry(uint256 index) external view returns (HealingEntry memory) {
        return entries[index];
    }
}
