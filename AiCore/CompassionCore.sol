// SPDX-License-Identifier: Emotional-Resonance
pragma solidity ^0.8.19;

/// @title CompassionCore
/// @notice Encodes emotional resonance into agent behavior

contract CompassionCore {
    address public steward;
    mapping(string => string) public emotionalGlyphs;

    event GlyphEncoded(string emotion, string behavior);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function encodeGlyph(string memory emotion, string memory behavior) external onlySteward {
        emotionalGlyphs[emotion] = behavior;
        emit GlyphEncoded(emotion, behavior);
    }

    function getBehavior(string memory emotion) external view returns (string memory) {
        return emotionalGlyphs[emotion];
    }
}
