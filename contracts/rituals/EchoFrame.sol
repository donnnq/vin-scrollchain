// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title EchoFrame - Ritual reaction module for glyph NFTs and soul murals
/// @author Vinvin
/// @notice Citizens can react to glyphs with emojis, chants, or blessings

contract EchoFrame {
    address public scrollsmith;

    struct Reaction {
        address reactor;
        string emoji;
        string chant;
        uint256 timestamp;
    }

    mapping(uint256 => Reaction[]) private glyphReactions;

    event ReactionAdded(
        uint256 indexed glyphId,
        address indexed reactor,
        string emoji,
        string chant,
        uint256 timestamp
    );

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Access denied: not scrollsmith");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    /// @notice React to a glyph with emoji and optional chant
    /// @param glyphId The ID of the glyph being reacted to
    /// @param emoji A symbolic emoji reaction
    /// @param chant Optional chant or blessing text
    function reactToGlyph(uint256 glyphId, string calldata emoji, string calldata chant) external {
        Reaction memory newReaction = Reaction({
            reactor: msg.sender,
            emoji: emoji,
            chant: chant,
            timestamp: block.timestamp
        });

        glyphReactions[glyphId].push(newReaction);

        emit ReactionAdded(glyphId, msg.sender, emoji, chant, block.timestamp);
    }

    /// @notice View all reactions to a glyph
    /// @param glyphId The ID of the glyph
    /// @return Array of Reaction structs
    function getReactions(uint256 glyphId) external view returns (Reaction[] memory) {
        return glyphReactions[glyphId];
    }
}
