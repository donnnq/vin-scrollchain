// SPDX-License-Identifier: Biodiversity-Ritual
pragma solidity ^0.8.19;

/// @title EcoGlyphPropagation
/// @notice Encodes seed rituals and biodiversity chants for planetary restoration

contract EcoGlyphPropagation {
    address public steward;

    struct Glyph {
        string name;
        string species;
        string ritual;
        string chant;
    }

    mapping(string => Glyph) public glyphs;
    string[] public glyphKeys;

    event GlyphEncoded(string name, string species, string ritual);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function encodeGlyph(
        string memory key,
        string memory name,
        string memory species,
        string memory ritual,
        string memory chant
    ) external onlySteward {
        glyphs[key] = Glyph(name, species, ritual, chant);
        glyphKeys.push(key);
        emit GlyphEncoded(name, species, ritual);
    }

    function getGlyph(string memory key) external view returns (Glyph memory) {
        return glyphs[key];
    }
}
