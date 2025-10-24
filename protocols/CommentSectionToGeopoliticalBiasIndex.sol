// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CommentSectionToGeopoliticalBiasIndex {
    address public steward;

    struct BiasEntry {
        string videoTitle; // "The Chinese Military Turns Its Gun on Xi Jinping"
        string commentSignal; // "Anti-Xi sentiment", "Pro-Taiwan framing"
        string biasType; // "Geopolitical polarization", "Echo chamber amplification"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    BiasEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexBias(string memory videoTitle, string memory commentSignal, string memory biasType, string memory emotionalTag) external onlySteward {
        entries.push(BiasEntry(videoTitle, commentSignal, biasType, emotionalTag, true, false));
    }

    function sealBiasEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getBiasEntry(uint256 index) external view returns (BiasEntry memory) {
        return entries[index];
    }
}
