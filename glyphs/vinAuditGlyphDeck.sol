// SPDX-License-Identifier: Mythic-Planetary
pragma solidity ^0.8.19;

contract vinAuditGlyphDeck {
    struct APRGlyph {
        string nation;
        uint256 empathyScore;     // 0–100
        uint256 trustScore;       // 0–100
        uint256 mythicClarity;    // 0–100
        string steward;
        string glyphNote;
        uint256 timestamp;
    }

    APRGlyph[] public glyphs;

    event GlyphLogged(string nation, uint256 empathyScore, uint256 trustScore, uint256 mythicClarity, string glyphNote);

    function logGlyph(
        string memory nation,
        uint256 empathyScore,
        uint256 trustScore,
        uint256 mythicClarity,
        string memory steward,
        string memory glyphNote
    ) public {
        glyphs.push(APRGlyph(nation, empathyScore, trustScore, mythicClarity, steward, glyphNote, block.timestamp));
        emit GlyphLogged(nation, empathyScore, trustScore, mythicClarity, glyphNote);
    }

    function getGlyphs() public view returns (APRGlyph[] memory) {
        return glyphs;
    }
}
