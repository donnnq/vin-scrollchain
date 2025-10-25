// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FloodToDisplacementTracker {
    address public steward;

    struct DisplacementEntry {
        string region; // "Shaanxi", "Henan", "Guangxi"
        string floodEvent; // "Dam overflow", "River breach"
        string displacementSignal; // "Evacuation", "Livelihood loss"
        string emotionalTag;
        bool tracked;
        bool sealed;
    }

    DisplacementEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function trackDisplacement(string memory region, string memory floodEvent, string memory displacementSignal, string memory emotionalTag) external onlySteward {
        entries.push(DisplacementEntry(region, floodEvent, displacementSignal, emotionalTag, true, false));
    }

    function sealDisplacementEntry(uint256 index) external onlySteward {
        require(entries[index].tracked, "Must be tracked first");
        entries[index].sealed = true;
    }

    function getDisplacementEntry(uint256 index) external view returns (DisplacementEntry memory) {
        return entries[index];
    }
}
