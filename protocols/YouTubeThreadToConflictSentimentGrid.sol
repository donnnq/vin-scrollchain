// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract YouTubeThreadToConflictSentimentGrid {
    address public steward;

    struct SentimentEntry {
        string threadTopic; // "Bataysk missile strike"
        string commentSignal; // "Russia vs Ukraine drone hypocrisy"
        string sentimentType; // "Anger", "Hypocrisy callout", "Global tension"
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

    function trackSentiment(string memory threadTopic, string memory commentSignal, string memory sentimentType, string memory emotionalTag) external onlySteward {
        entries.push(SentimentEntry(threadTopic, commentSignal, sentimentType, emotionalTag, true, false));
    }

    function sealSentimentEntry(uint256 index) external onlySteward {
        require(entries[index].tracked, "Must be tracked first");
        entries[index].sealed = true;
    }

    function getSentimentEntry(uint256 index) external view returns (SentimentEntry memory) {
        return entries[index];
    }
}
