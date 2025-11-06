// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WaterSovereigntySentimentIndex {
    address public steward;

    struct SentimentEntry {
        string region;
        string waterAccessLevel;
        string civicSentiment;
        string emotionalTag;
    }

    SentimentEntry[] public index;

    event WaterSentimentTagged(string region, string waterAccessLevel, string civicSentiment, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagSentiment(
        string memory region,
        string memory waterAccessLevel,
        string memory civicSentiment,
        string memory emotionalTag
    ) public onlySteward {
        index.push(SentimentEntry(region, waterAccessLevel, civicSentiment, emotionalTag));
        emit WaterSentimentTagged(region, waterAccessLevel, civicSentiment, emotionalTag);
    }
}
