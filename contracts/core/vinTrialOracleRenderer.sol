// SPDX-License-Identifier: Mythstream-Vault  
pragma solidity ^0.8.19;

contract vinTrialOracleRenderer {
    struct VerdictGlyph {
        uint256 caseId;
        string defendant;
        string verdictType;
        string kiligColor;
        string emojiAura;
        uint256 timestamp;
    }

    mapping(uint256 => VerdictGlyph) public verdictVisuals;

    event VerdictGlyphCreated(
        uint256 indexed caseId,
        string defendant,
        string verdictType,
        string kiligColor,
        string emojiAura,
        uint256 timestamp
    );

    function renderGlyph(
        uint256 _caseId,
        string memory _defendant,
        string memory _verdictType,
        string memory _kiligColor,
        string memory _emojiAura
    ) external {
        verdictVisuals[_caseId] = VerdictGlyph(
            _caseId,
            _defendant,
            _verdictType,
            _kiligColor,
            _emojiAura,
            block.timestamp
        );

        emit VerdictGlyphCreated(
            _caseId,
            _defendant,
            _verdictType,
            _kiligColor,
            _emojiAura,
            block.timestamp
        );
    }

    function getGlyph(uint256 _caseId) external view returns (VerdictGlyph memory) {
        return verdictVisuals[_caseId];
    }
}
