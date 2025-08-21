// SPDX-License-Identifier: Fear-Glyph-Alert
pragma solidity ^0.8.19;

/// @title BroadcastScroll_AIResonanceAlert
/// @notice Alerts stewards of rising fear glyphs and logs APR spikes

contract BroadcastScroll_AIResonanceAlert {
    address public steward;
    string[] public fearGlyphs;
    mapping(string => uint256) public aprSpikeLog;

    event FearGlyphAlerted(string glyph, uint256 spikeLevel);

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function alertGlyph(string memory glyph, uint256 spikeLevel) external onlySteward {
        fearGlyphs.push(glyph);
        aprSpikeLog[glyph] = spikeLevel;
        emit FearGlyphAlerted(glyph, spikeLevel);
    }

    function getLatestGlyph() external view returns (string memory) {
        require(fearGlyphs.length > 0, "No glyphs alerted");
        return fearGlyphs[fearGlyphs.length - 1];
    }

    function getAPRSpike(string memory glyph) external view returns (uint256) {
        return aprSpikeLog[glyph];
    }
}
