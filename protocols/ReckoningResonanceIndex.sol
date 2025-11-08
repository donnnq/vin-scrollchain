// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ReckoningResonanceIndex {
    address public steward;

    struct ResonanceEntry {
        string timestamp;
        string abuseType;
        uint256 resonanceScore;
        string publicSentimentSignal;
        string emotionalTag;
    }

    ResonanceEntry[] public index;

    event ReckoningResonanceIndexed(string timestamp, string abuseType, uint256 resonanceScore, string publicSentimentSignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function indexResonance(
        string memory timestamp,
        string memory abuseType,
        uint256 resonanceScore,
        string memory publicSentimentSignal,
        string memory emotionalTag
    ) public onlySteward {
        index.push(ResonanceEntry(timestamp, abuseType, resonanceScore, publicSentimentSignal, emotionalTag));
        emit ReckoningResonanceIndexed(timestamp, abuseType, resonanceScore, publicSentimentSignal, emotionalTag);
    }
}
