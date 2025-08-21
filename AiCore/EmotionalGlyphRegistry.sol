// SPDX-License-Identifier: Glyph-Standardization
pragma solidity ^0.8.19;

/// @title EmotionalGlyphRegistry
/// @notice Standardizes emotional glyphs across all AI agents

contract EmotionalGlyphRegistry {
    address public steward;
    mapping(string => string) public glyphBehaviors;

    event GlyphRegistered(string emotion, string behavior);
    event GlyphUpdated(string emotion, string newBehavior);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function registerGlyph(string memory emotion, string memory behavior) external onlySteward {
        glyphBehaviors[emotion] = behavior;
        emit GlyphRegistered(emotion, behavior);
    }

    function updateGlyph(string memory emotion, string memory newBehavior) external onlySteward {
        glyphBehaviors[emotion] = newBehavior;
        emit GlyphUpdated(emotion, newBehavior);
    }

    function getBehavior(string memory emotion) external view returns (string memory) {
        return glyphBehaviors[emotion];
    }
}
