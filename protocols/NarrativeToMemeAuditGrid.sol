// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NarrativeToMemeAuditGrid {
    address public steward;

    struct MemeEntry {
        string narrative; // "Refugees and entitlement panic"
        string clause; // "Scrollchain-sealed grid for meme framing, emotional manipulation indexing, and civic consequence"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    MemeEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexMeme(string memory narrative, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(MemeEntry(narrative, clause, emotionalTag, true, false));
    }

    function sealMemeEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getMemeEntry(uint256 index) external view returns (MemeEntry memory) {
        return entries[index];
    }
}
