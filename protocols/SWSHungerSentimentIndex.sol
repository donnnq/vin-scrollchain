// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SWSHungerSentimentIndex {
    address public steward;

    struct SentimentEntry {
        string region;
        string priorityIssue; // "Food prices", "Corruption", "Wages"
        uint256 supportPercentage;
        string emotionalTag;
        bool logged;
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

    function logSentiment(string memory region, string memory priorityIssue, uint256 supportPercentage, string memory emotionalTag) external onlySteward {
        require(supportPercentage >= 50, "Must reflect majority sentiment");
        entries.push(SentimentEntry(region, priorityIssue, supportPercentage, emotionalTag, true, false));
    }

    function sealSentimentEntry(uint256 index) external onlySteward {
        require(entries[index].logged, "Must be logged first");
        entries[index].sealed = true;
    }

    function getSentimentEntry(uint256 index) external view returns (SentimentEntry memory) {
        return entries[index];
    }
}
