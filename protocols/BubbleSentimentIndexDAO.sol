// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BubbleSentimentIndexDAO {
    address public steward;

    struct SentimentEntry {
        string assetClass;
        uint256 indexScore;
        string timestamp;
        string publicMood;
        string emotionalTag;
    }

    SentimentEntry[] public index;

    event BubbleSentimentLogged(string assetClass, uint256 indexScore, string timestamp, string publicMood, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logSentiment(
        string memory assetClass,
        uint256 indexScore,
        string memory timestamp,
        string memory publicMood,
        string memory emotionalTag
    ) public onlySteward {
        index.push(SentimentEntry(assetClass, indexScore, timestamp, publicMood, emotionalTag));
        emit BubbleSentimentLogged(assetClass, indexScore, timestamp, publicMood, emotionalTag);
    }
}
