// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ZeroDayToPatchTimelineTracker {
    address public steward;

    struct PatchEntry {
        string vulnerabilityID; // "CVE-2025-53770"
        string discoveryDate;
        string patchReleaseDate;
        uint256 daysElapsed;
        string emotionalTag;
        bool tracked;
        bool sealed;
    }

    PatchEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function trackPatch(string memory vulnerabilityID, string memory discoveryDate, string memory patchReleaseDate, uint256 daysElapsed, string memory emotionalTag) external onlySteward {
        entries.push(PatchEntry(vulnerabilityID, discoveryDate, patchReleaseDate, daysElapsed, emotionalTag, true, false));
    }

    function sealPatchEntry(uint256 index) external onlySteward {
        require(entries[index].tracked, "Must be tracked first");
        entries[index].sealed = true;
    }

    function getPatchEntry(uint256 index) external view returns (PatchEntry memory) {
        return entries[index];
    }
}
