contract vinUrbanGlyphDisplay {
    address public moodOracle;
    string public currentGlyph;
    uint256 public lastUpdate;

    event GlyphUpdated(string glyph, uint256 timestamp);

    constructor(address _oracle) {
        moodOracle = _oracle;
    }

    function updateGlyph() public {
        uint256 moodScore = vinCivicMoodOracle(moodOracle).getAverageMood();
        currentGlyph = interpretMood(moodScore);
        lastUpdate = block.timestamp;
        emit GlyphUpdated(currentGlyph, lastUpdate);
    }

    function interpretMood(uint256 moodScore) internal pure returns (string memory) {
        if (moodScore <= 30) return "🟥 Glyph of Tension";
        if (moodScore <= 45) return "🟧 Glyph of Stirring";
        if (moodScore <= 60) return "🟨 Glyph of Stillness";
        if (moodScore <= 80) return "🟩 Glyph of Harmony";
        if (moodScore <= 95) return "🟦 Glyph of Joy";
        return "🟪 Glyph of Celestial Resonance";
    }

    function getGlyph() public view returns (string memory) {
        return currentGlyph;
    }
}
