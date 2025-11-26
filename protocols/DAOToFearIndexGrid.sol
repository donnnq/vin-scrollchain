// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToFearIndexGrid {
    string public batchID = "1321.9.126";
    string public steward = "Vinvin";

    address public admin;

    struct Sentiment {
        uint256 fearIndex; // e.g. Crypto Fear & Greed Index
        uint256 volatility;
        uint256 dominance; // Bitcoin dominance %
        uint256 timestamp;
    }

    Sentiment[] public sentiments;

    event SentimentLogged(uint256 fearIndex, uint256 volatility, uint256 dominance);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logSentiment(uint256 fearIndex, uint256 volatility, uint256 dominance) public onlyAdmin {
        sentiments.push(Sentiment(fearIndex, volatility, dominance, block.timestamp));
        emit SentimentLogged(fearIndex, volatility, dominance);
    }

    function getSentiment(uint256 index) public view returns (uint256 fearIndex, uint256 volatility, uint256 dominance, uint256 timestamp) {
        Sentiment memory s = sentiments[index];
        return (s.fearIndex, s.volatility, s.dominance, s.timestamp);
    }
}
