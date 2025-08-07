// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

/// @title vinTrustAbuseVisualizer.sol
/// @notice Renders glyphs and civic alerts from trust abuse signals
contract vinTrustAbuseVisualizer {
    struct AbuseGlyph {
        string glyphName;
        string civicAlert;
        uint256 severityLevel;
        uint256 timestamp;
    }

    mapping(bytes32 => AbuseGlyph) public glyphRegistry;

    event GlyphRendered(
        string glyphName,
        string civicAlert,
        uint256 severityLevel,
        uint256 timestamp
    );

    /// @notice Render a glyph from a trust abuse signal
    function renderGlyph(
        string memory abusedComponent,
        string memory methodUsed,
        string memory context,
        uint256 severityLevel
    ) external {
        bytes32 abuseHash = keccak256(abi.encodePacked(abusedComponent, methodUsed, context));
        string memory glyphName = string(abi.encodePacked("Glyph_", abusedComponent));
        string memory civicAlert = string(abi.encodePacked("⚠️ ", methodUsed, " detected in ", context));

        glyphRegistry[abuseHash] = AbuseGlyph({
            glyphName: glyphName,
            civicAlert: civicAlert,
            severityLevel: severityLevel,
            timestamp: block.timestamp
        });

        emit GlyphRendered(glyphName, civicAlert, severityLevel, block.timestamp);
    }

    /// @notice Retrieve glyph metadata
    function getGlyph(bytes32 abuseHash) external view returns (AbuseGlyph memory) {
        return glyphRegistry[abuseHash];
    }
}
