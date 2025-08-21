// SPDX-License-Identifier: Mythic-Cinema
pragma solidity ^0.8.19;

/// @title SanctumOverlay
/// @notice Visualizes tariff collapse and ally shielding in mythic cinematic form

contract SanctumOverlay {
    address public steward;
    string[] public visualGlyphs;
    mapping(string => bool) public renderedScenes;

    event SceneRendered(string indexed glyph);

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function addVisualGlyph(string memory glyph) external onlySteward {
        visualGlyphs.push(glyph);
    }

    function renderScene(string memory glyph) external onlySteward {
        require(bytes(glyph).length > 0, "Invalid glyph");
        renderedScenes[glyph] = true;
        emit SceneRendered(glyph);
    }

    function isSceneRendered(string memory glyph) external view returns (bool) {
        return renderedScenes[glyph];
    }

    function getAllGlyphs() external view returns (string[] memory) {
        return visualGlyphs;
    }
}
