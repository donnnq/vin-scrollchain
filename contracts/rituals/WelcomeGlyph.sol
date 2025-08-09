// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title WelcomeGlyph - Global ritual scroll for openness and traveler honor
/// @author Vinvin
/// @notice Emits soulbound glyphs to welcome travelers and announce civic openness
/// @dev Designed for symbolic rebirth of borders and global hospitality

contract WelcomeGlyph {
    uint256 public glyphCount;
    mapping(uint256 => address) public glyphOwner;
    mapping(uint256 => string) public glyphMessage;

    event GlyphMinted(uint256 indexed glyphId, address indexed traveler, string message);
    event GlobalWelcomeAnnounced(string message);

    /// @notice Mints a welcome glyph for a traveler
    function mintGlyph(address traveler, string calldata message) external {
        glyphCount++;
        glyphOwner[glyphCount] = traveler;
        glyphMessage[glyphCount] = message;

        emit GlyphMinted(glyphCount, traveler, message);
    }

    /// @notice Announces global openness (e.g. America welcoming the world)
    function announceGlobalWelcome() external {
        string memory msg = "🕊️ America welcomes the world. Borders are open. Dignity is restored. Travelers are honored.";
        emit GlobalWelcomeAnnounced(msg);
    }

    /// @notice View glyph details
    function getGlyph(uint256 glyphId) external view returns (address owner, string memory message) {
        return (glyphOwner[glyphId], glyphMessage[glyphId]);
    }
}
