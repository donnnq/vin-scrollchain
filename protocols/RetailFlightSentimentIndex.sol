// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RetailFlightSentimentIndex {
    address public steward;

    struct SentimentEntry {
        string platform;
        string asset;
        string timestamp;
        string sentiment; // e.g., "Fear", "Greed", "Neutral"
        uint256 volumeChange;
    }

    SentimentEntry[] public index;

    event RetailSentimentLogged(string platform, string asset, string timestamp, string sentiment, uint256 volumeChange);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logSentiment(
        string memory platform,
        string memory asset,
        string memory timestamp,
        string memory sentiment,
        uint256 volumeChange
    ) public onlySteward {
        index.push(SentimentEntry(platform, asset, timestamp, sentiment, volumeChange));
        emit RetailSentimentLogged(platform, asset, timestamp, sentiment, volumeChange);
    }
}
