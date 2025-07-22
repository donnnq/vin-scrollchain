// SPDX-License-Identifier: Mythstream-EmotionSync
pragma solidity ^0.8.20;

contract vinNorthernLightMoodEngine {
    struct MoodAurora {
        string moodKeyword;
        string dominantColor;
        string auroraPattern;
        uint256 emotionalCharge;
        string soundtrackCue;
    }

    MoodAurora[] public auroraMoodPalette;

    event AuroraMoodTriggered(
        string moodKeyword,
        string dominantColor,
        string auroraPattern,
        uint256 emotionalCharge,
        string soundtrackCue
    );

    function triggerAuroraMood(
        string memory moodKeyword,
        string memory color,
        string memory pattern,
        uint256 charge,
        string memory cue
    ) public {
        MoodAurora memory vibe = MoodAurora(
            moodKeyword,
            color,
            pattern,
            charge,
            cue
        );
        auroraMoodPalette.push(vibe);
        emit AuroraMoodTriggered(moodKeyword, color, pattern, charge, cue);
    }

    function latestAuroraMood() public view returns (MoodAurora memory) {
        require(auroraMoodPalette.length > 0, "No mood signals yet.");
        return auroraMoodPalette[auroraMoodPalette.length - 1];
    }
}
