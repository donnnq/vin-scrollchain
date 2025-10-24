// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CommentToGeopoliticalSentimentTracker {
    address public steward;

    struct SentimentEntry {
        string videoTitle; // "The Chinese Military Turns Its Gun on Xi Jinping"
        string commentSignal; // "Anti-Xi", "Pro-Taiwan", "US-China tension"
        string sentimentType; // "Polarized", "Nationalist", "Critical"
        string emotionalTag;
        bool tracked;
        bool sealed;
    }

    SentimentEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function trackSentiment(string memory videoTitle, string memory commentSignal, string memory sentimentType, string memory emotionalTag) external onlySteward {
        entries.push(SentimentEntry(videoTitle, commentSignal, sentimentType, emotionalTag, true, false));
    }

    function sealSentimentEntry(uint256 index) external onlySteward {
        require(entries[index].tracked, "Must be tracked first");
        entries[index].sealed = true;
    }

    function getSentimentEntry(uint256 index) external view returns (SentimentEntry memory) {
        return entries[index];
    }
}
