// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SenateSilenceToMemeSovereigntyBroadcast {
    address public steward;

    struct MemeEntry {
        string caseName;
        string memeFormat; // "Satire", "Parody", "Audit meme"
        string broadcastChannel; // "Social media", "Public ledger", "Civic theater"
        string emotionalTag;
        bool broadcasted;
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

    function broadcastMeme(string memory caseName, string memory memeFormat, string memory broadcastChannel, string memory emotionalTag) external onlySteward {
        entries.push(MemeEntry(caseName, memeFormat, broadcastChannel, emotionalTag, true, false));
    }

    function sealMemeEntry(uint256 index) external onlySteward {
        require(entries[index].broadcasted, "Must be broadcasted first");
        entries[index].sealed = true;
    }

    function getMemeEntry(uint256 index) external view returns (MemeEntry memory) {
        return entries[index];
    }
}
