// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayFeedingActivationProtocol {
    address public steward;

    struct FeedingEntry {
        string barangayName;
        string targetGroup; // "Children", "Pregnant women", "Elderly", "Low-income families"
        string foodType; // "Rice meal", "Vegetable soup", "Protein pack"
        string emotionalTag;
        bool activated;
        bool sealed;
    }

    FeedingEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function activateFeeding(string memory barangayName, string memory targetGroup, string memory foodType, string memory emotionalTag) external onlySteward {
        entries.push(FeedingEntry(barangayName, targetGroup, foodType, emotionalTag, true, false));
    }

    function sealFeedingEntry(uint256 index) external onlySteward {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getFeedingEntry(uint256 index) external view returns (FeedingEntry memory) {
        return entries[index];
    }
}
