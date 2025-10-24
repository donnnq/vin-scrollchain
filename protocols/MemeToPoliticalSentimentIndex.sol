// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MemeToPoliticalSentimentIndex {
    address public steward;

    struct MemeEntry {
        string memeText; // "Matatakot ang mga kurap kay Cong. Sandro"
        string sentimentSignal; // "Anti-corruption", "Youth empowerment"
        string memeTone; // "Satirical", "Supportive", "Provocative"
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

    function indexMeme(string memory memeText, string memory sentimentSignal, string memory memeTone, string memory emotionalTag) external onlySteward {
        entries.push(MemeEntry(memeText, sentimentSignal, memeTone, emotionalTag, true, false));
    }

    function sealMemeEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getMemeEntry(uint256 index) external view returns (MemeEntry memory) {
        return entries[index];
    }
}
