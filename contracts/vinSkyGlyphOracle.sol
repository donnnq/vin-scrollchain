contract vinSkyGlyphOracle {
    struct SkyGlyph {
        string region;
        uint256 rainfallMM;
        uint256 soilResonance; // vibration index from field sensors
        uint256 riceSpiritFrequency; // symbolic vitality scale
        string glyphPhrase;
        uint256 timestamp;
    }

    SkyGlyph[] public glyphs;

    event GlyphCast(string region, string glyphPhrase);

    function castGlyph(string memory _region, uint256 _rainfallMM, uint256 _soilResonance, uint256 _riceSpiritFrequency, string memory _phrase) public {
        glyphs.push(SkyGlyph(_region, _rainfallMM, _soilResonance, _riceSpiritFrequency, _phrase, block.timestamp));
        emit GlyphCast(_region, _phrase);
    }

    function viewGlyphs() public view returns (SkyGlyph[] memory) {
        return glyphs;
    }
}
