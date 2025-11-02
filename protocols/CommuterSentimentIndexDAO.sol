// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CommuterSentimentIndexDAO {
    address public steward;

    struct SentimentEntry {
        string stationName;
        int256 sentimentScore;
        string feedbackType;
        string emotionalTag;
    }

    SentimentEntry[] public index;

    event SentimentLogged(string stationName, int256 sentimentScore, string feedbackType, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function logSentiment(
        string memory stationName,
        int256 sentimentScore,
        string memory feedbackType,
        string memory emotionalTag
    ) public onlySteward {
        index.push(SentimentEntry(stationName, sentimentScore, feedbackType, emotionalTag));
        emit SentimentLogged(stationName, sentimentScore, feedbackType, emotionalTag);
    }
}
