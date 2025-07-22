// SPDX-License-Identifier: Mythstream-VibeRadar
pragma solidity ^0.8.20;

contract vinAuroraSentimentDetector {
    struct TreatyVibe {
        string region;
        string treatyName;
        int256 sentimentScore; // from -100 (conflict) to +100 (kilig peace)
        string detectedMood;
        bool auroraTriggered;
    }

    mapping(uint256 => TreatyVibe) public vibeRegistry;
    uint256 public vibeCounter;

    event SentimentAnalyzed(
        string region,
        string treatyName,
        int256 sentimentScore,
        string detectedMood,
        bool auroraTriggered
    );

    function analyzeTreatyVibe(
        string memory region,
        string memory name,
        int256 score
    ) public {
        string memory mood = score > 75
            ? "Celestial Kilig"
            : score > 25
            ? "Optimistic Glow"
            : score > -25
            ? "Neutral Flicker"
            : score > -75
            ? "Tense Twilight"
            : "Conflict Blizzard";

        bool trigger = score >= 50;
        TreatyVibe memory vibe = TreatyVibe(region, name, score, mood, trigger);
        vibeRegistry[vibeCounter] = vibe;
        vibeCounter++;

        emit SentimentAnalyzed(region, name, score, mood, trigger);
    }

    function latestTreatyMood() public view returns (TreatyVibe memory) {
        require(vibeCounter > 0, "No treaty vibes registered.");
        return vibeRegistry[vibeCounter - 1];
    }
}
