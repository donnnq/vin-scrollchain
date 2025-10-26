// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ScienceToPublicEngagementGrid {
    address public steward;

    struct EngagementEntry {
        string sector; // "Nuclear science, energy policy, climate resilience"
        string engagementMode; // "Town halls, livestream audits, citizen Q&A"
        string emotionalTag;
        bool activated;
        bool sealed;
    }

    EngagementEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function activateEngagement(string memory sector, string memory engagementMode, string memory emotionalTag) external onlySteward {
        entries.push(EngagementEntry(sector, engagementMode, emotionalTag, true, false));
    }

    function sealEngagementEntry(uint256 index) external onlySteward {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getEngagementEntry(uint256 index) external view returns (EngagementEntry memory) {
        return entries[index];
    }
}
