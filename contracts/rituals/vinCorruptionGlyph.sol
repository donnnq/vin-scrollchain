// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinCorruptionGlyph {
    enum Stage { Collusion, GhostProject, SOPCut, TaxEvasion, LGUTaxZero, PoliticalLaundering }

    struct Glyph {
        Stage stage;
        string description;
        string evidenceHash;
        address whistleblower;
    }

    Glyph[] public glyphs;

    event GlyphEncoded(Stage stage, string description);

    function encodeGlyph(
        Stage stage,
        string memory description,
        string memory evidenceHash
    ) public {
        glyphs.push(Glyph(stage, description, evidenceHash, msg.sender));
        emit GlyphEncoded(stage, description);
    }

    function getGlyph(uint index) public view returns (Glyph memory) {
        return glyphs[index];
    }
}
