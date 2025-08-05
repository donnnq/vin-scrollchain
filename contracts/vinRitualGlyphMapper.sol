pragma solidity ^0.8.18;

contract vinRitualGlyphMapper {
    address public glyphMaster;

    struct Glyph {
        string signalSource;   // e.g. DAO, HarvestOracle, CivicPulse
        string moodType;       // e.g. "Urgency", "Gratitude", "Resilience"
        string styleCode;      // e.g. "spiral-fire", "bayanWave", "rainGlyph"
        uint256 timestamp;
    }

    Glyph[] public glyphLog;

    event GlyphMapped(string signalSource, string moodType, string styleCode, uint256 timestamp);

    modifier onlyMaster() {
        require(msg.sender == glyphMaster, "Unauthorized");
        _;
    }

    constructor(address _master) {
        glyphMaster = _master;
    }

    function mapGlyph(string memory _signalSource, string memory _moodType, string memory _styleCode) external onlyMaster {
        Glyph memory newGlyph = Glyph(_signalSource, _moodType, _styleCode, block.timestamp);
        glyphLog.push(newGlyph);
        emit GlyphMapped(_signalSource, _moodType, _styleCode, block.timestamp);
    }

    function getLatestGlyph() external view returns (Glyph memory) {
        require(glyphLog.length > 0, "No glyphs mapped yet");
        return glyphLog[glyphLog.length - 1];
    }

    function getAllGlyphs() external view returns (Glyph[] memory) {
        return glyphLog;
    }
}
