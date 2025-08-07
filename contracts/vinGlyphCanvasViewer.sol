pragma solidity ^0.8.18;

contract vinGlyphCanvasViewer {
    address public viewerMaster;

    struct CanvasGlyph {
        string styleCode;     // from RitualGlyphMapper, e.g. "bayanWave"
        string colorHex;      // e.g. "#a7d948"
        string animationType; // e.g. "shimmer", "pulse", "ripple"
        string region;
        uint256 timestamp;
    }

    CanvasGlyph[] public canvasQueue;

    event GlyphRendered(string styleCode, string region, string animationType, uint256 timestamp);

    modifier onlyMaster() {
        require(msg.sender == viewerMaster, "Unauthorized");
        _;
    }

    constructor(address _master) {
        viewerMaster = _master;
    }

    function renderGlyph(
        string memory _styleCode,
        string memory _colorHex,
        string memory _animationType,
        string memory _region
    ) external onlyMaster {
        canvasQueue.push(CanvasGlyph(_styleCode, _colorHex, _animationType, _region, block.timestamp));
        emit GlyphRendered(_styleCode, _region, _animationType, block.timestamp);
    }

    function getRecentGlyph() external view returns (CanvasGlyph memory) {
        require(canvasQueue.length > 0, "No glyphs rendered yet");
        return canvasQueue[canvasQueue.length - 1];
    }

    function getCanvasLog() external view returns (CanvasGlyph[] memory) {
        return canvasQueue;
    }
}
