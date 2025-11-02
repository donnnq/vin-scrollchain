// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicSentimentIndexDAO {
    address public steward;

    struct SentimentEntry {
        string subject;
        string corridor;
        int256 sentimentScore;
        string emotionalTag;
    }

    SentimentEntry[] public registry;

    event SentimentTagged(string subject, string corridor, int256 sentimentScore, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagSentiment(
        string memory subject,
        string memory corridor,
        int256 sentimentScore,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(SentimentEntry(subject, corridor, sentimentScore, emotionalTag));
        emit SentimentTagged(subject, corridor, sentimentScore, emotionalTag);
    }
}
