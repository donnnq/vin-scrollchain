// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ScrollOfEmotionallyIntelligentBlockReading {
    struct BlockMood {
        uint256 blockNumber;
        uint256 txVolume;
        int256 priceImpact;
        string moodTag; // Example: “Kaching”, “Flatline”, “Kabig Surge”
        string interpretation;
    }

    mapping(uint256 => BlockMood) public moodLog;
    uint256 public moodCount;

    event MoodLogged(uint256 blockNumber, string moodTag, string interpretation);

    function logBlockMood(
        uint256 _blockNumber,
        uint256 _txVolume,
        int256 _priceImpact,
        string memory _moodTag,
        string memory _interpretation
    ) public {
        moodCount++;
        moodLog[moodCount] = BlockMood(_blockNumber, _txVolume, _priceImpact, _moodTag, _interpretation);
        emit MoodLogged(_blockNumber, _moodTag, _interpretation);
    }
}
