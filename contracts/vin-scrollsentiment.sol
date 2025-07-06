// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinScrollSentiment {
    struct Sentiment {
        string label;
        string source;
        string description;
        uint256 timestamp;
    }

    Sentiment[] public sentiments;
    address public immutable interpreter;

    event SentimentLogged(string label, string source, string description, uint256 indexed index, uint256 timestamp);

    modifier onlyInterpreter() {
        require(msg.sender == interpreter, "Not the interpreter");
        _;
    }

    constructor() {
        interpreter = msg.sender;
    }

    function logSentiment(string calldata label, string calldata source, string calldata description) external onlyInterpreter {
        sentiments.push(Sentiment({
            label: label,
            source: source,
            description: description,
            timestamp: block.timestamp
        }));

        emit SentimentLogged(label, source, description, sentiments.length - 1, block.timestamp);
    }

    function getSentiment(uint256 index) external view returns (Sentiment memory) {
        require(index < sentiments.length, "Invalid index");
        return sentiments[index];
    }

    function latestSentiment() external view returns (Sentiment memory) {
        require(sentiments.length > 0, "No sentiment logged");
        return sentiments[sentiments.length - 1];
    }

    function totalSentiments() external view returns (uint256) {
        return sentiments.length;
    }
}
