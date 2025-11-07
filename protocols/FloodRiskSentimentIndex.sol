// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FloodRiskSentimentIndex {
    address public steward;

    struct RiskEntry {
        string barangay;
        string timestamp;
        string perceivedRiskLevel;
        string recentFloodHistory;
        string emotionalTag;
    }

    RiskEntry[] public index;

    event RiskSentimentLogged(string barangay, string timestamp, string perceivedRiskLevel, string recentFloodHistory, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logRiskSentiment(
        string memory barangay,
        string memory timestamp,
        string memory perceivedRiskLevel,
        string memory recentFloodHistory,
        string memory emotionalTag
    ) public onlySteward {
        index.push(RiskEntry(barangay, timestamp, perceivedRiskLevel, recentFloodHistory, emotionalTag));
        emit RiskSentimentLogged(barangay, timestamp, perceivedRiskLevel, recentFloodHistory, emotionalTag);
    }
}
