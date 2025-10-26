// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LlamasToPlanetaryCommentaryTreaty {
    address public steward;

    struct CommentaryEntry {
        string analystName; // "Ronald Llamas"
        string commentaryType; // "Political critique, transparency audit"
        string emotionalTag; // "Bangis, civic fire, scrollchain resonance"
        bool archived;
        bool sealed;
    }

    CommentaryEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function archiveCommentary(string memory analystName, string memory commentaryType, string memory emotionalTag) external onlySteward {
        entries.push(CommentaryEntry(analystName, commentaryType, emotionalTag, true, false));
    }

    function sealCommentaryEntry(uint256 index) external onlySteward {
        require(entries[index].archived, "Must be archived first");
        entries[index].sealed = true;
    }

    function getCommentaryEntry(uint256 index) external view returns (CommentaryEntry memory) {
        return entries[index];
    }
}
