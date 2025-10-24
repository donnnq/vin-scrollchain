// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CyberBackdropToNarrativeContainmentIndex {
    address public steward;

    struct ContainmentEntry {
        string visualCue; // "Hacker silhouette", "Multiple monitors"
        string narrativeType; // "Conspiracy framing", "Techno-anxiety", "Distrust amplification"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    ContainmentEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexContainment(string memory visualCue, string memory narrativeType, string memory emotionalTag) external onlySteward {
        entries.push(ContainmentEntry(visualCue, narrativeType, emotionalTag, true, false));
    }

    function sealContainmentEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getContainmentEntry(uint256 index) external view returns (ContainmentEntry memory) {
        return entries[index];
    }
}
