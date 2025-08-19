// SPDX-License-Identifier: Mythic-Restoration
pragma solidity ^0.8.19;

contract PeaceGlyphCompiler {
    struct Glyph {
        string name;
        string ritual;
        string steward;
        uint256 timestamp;
    }

    Glyph[] public peaceGlyphs;

    event GlyphEmbedded(string name, string ritual, string steward, uint256 timestamp);

    function embedGlyph(string memory name, string memory ritual, string memory steward) public {
        peaceGlyphs.push(Glyph(name, ritual, steward, block.timestamp));
        emit GlyphEmbedded(name, ritual, steward, block.timestamp);
    }

    function getGlyph(uint index) public view returns (Glyph memory) {
        return peaceGlyphs[index];
    }
}
