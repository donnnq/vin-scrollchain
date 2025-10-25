// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AntiPassThroughEnforcementGrid {
    address public steward;

    struct EnforcementEntry {
        string transitCountry; // "Singapore", "India"
        string originalProcessor; // "China Rare Earth Group"
        string detectionMethod; // "Origin trace", "Processing audit"
        string emotionalTag;
        bool flagged;
        bool sealed;
    }

    EnforcementEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function flagPassThrough(string memory transitCountry, string memory originalProcessor, string memory detectionMethod, string memory emotionalTag) external onlySteward {
        entries.push(EnforcementEntry(transitCountry, originalProcessor, detectionMethod, emotionalTag, true, false));
    }

    function sealEnforcementEntry(uint256 index) external onlySteward {
        require(entries[index].flagged, "Must be flagged first");
        entries[index].sealed = true;
    }

    function getEnforcementEntry(uint256 index) external view returns (EnforcementEntry memory) {
        return entries[index];
    }
}
