// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinScrollChainGuardianSentiment {
    address public sovereignCouncil;

    struct Sentiment {
        string guardian;
        string mood;           // e.g. "harmonious", "balanced", "strained", "critical"
        uint harmonyScore;     // 0–100 scale
        uint lastUpdated;      // block timestamp
    }

    mapping(string => Sentiment) public sentiments;

    event SentimentUpdated(
        string guardian,
        string mood,
        uint harmonyScore,
        uint timestamp
    );

    modifier onlyCouncil() {
        require(msg.sender == sovereignCouncil, "Unauthorized");
        _;
    }

    constructor(address _sovereignCouncil) {
        sovereignCouncil = _sovereignCouncil;
    }

    function updateSentiment(
        string memory guardian,
        uint pulseBpm,
        uint forecastConfidence
    ) public onlyCouncil {
        // Calculate harmony score as weighted average
        // pulseBpm: symbolic civic heartbeat (0–200)
        // forecastConfidence: oracle confidence (0–100)
        uint rawScore = (pulseBpm * forecastConfidence) / 200;  
        uint harmony = rawScore > 100 ? 100 : rawScore;          

        // Determine mood
        string memory moodTag;
        if (harmony >= 80) {
            moodTag = "harmonious";
        } else if (harmony >= 50) {
            moodTag = "balanced";
        } else if (harmony >= 20) {
            moodTag = "strained";
        } else {
            moodTag = "critical";
        }

        sentiments[guardian] = Sentiment({
            guardian: guardian,
            mood: moodTag,
            harmonyScore: harmony,
            lastUpdated: block.timestamp
        });

        emit SentimentUpdated(guardian, moodTag, harmony, block.timestamp);
    }

    function getSentiment(string memory guardian) public view returns (Sentiment memory) {
        require(bytes(sentiments[guardian].guardian).length != 0, "No sentiment found");
        return sentiments[guardian];
    }
}
