// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title BlessingSummonerBadge
/// @notice Soulbound badge for housing blessing deployers
contract BlessingSummonerBadge {
    mapping(address => bool) public hasBadge;
    mapping(address => string) public emotionalGlyph;

    event BadgeMinted(address indexed summoner, string glyph);

    /// @notice Mints a soulbound badge for a summoner with emotional glyph
    function mintBadge(string memory glyph) public {
        require(!hasBadge[msg.sender], "Badge already minted");

        hasBadge[msg.sender] = true;
        emotionalGlyph[msg.sender] = glyph;

        emit BadgeMinted(msg.sender, glyph);
    }

    /// @notice Checks if an address holds a badge
    function checkBadge(address summoner) public view returns (bool) {
        return hasBadge[summoner];
    }

    /// @notice Retrieves the emotional glyph of a summoner
    function getGlyph(address summoner) public view returns (string memory) {
        require(hasBadge[summoner], "No badge found");
        return emotionalGlyph[summoner];
    }
}
