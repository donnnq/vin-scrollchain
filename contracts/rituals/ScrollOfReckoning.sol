// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title ScrollOfReckoning - Visualizes nullified figures and their civic impact
/// @author Vinvin
/// @notice Connects to ImmunityNullifier to render symbolic reckoning

import "./ImmunityNullifier.sol";

contract ScrollOfReckoning {
    ImmunityNullifier public nullifier;

    constructor(address _nullifierAddress) {
        nullifier = ImmunityNullifier(_nullifierAddress);
    }

    struct ImpactGlyph {
        string name;
        string country;
        string traumaEcho;
        uint256 timestamp;
    }

    ImpactGlyph[] public glyphs;

    event GlyphEncoded(string name, string traumaEcho, uint256 timestamp);

    function encodeGlyph(string calldata name, string calldata traumaEcho) external {
        (, string memory country,, bool isNullified, uint256 timestamp) = getFigure(name);
        require(isNullified, "Figure not nullified");

        glyphs.push(ImpactGlyph(name, country, traumaEcho, timestamp));
        emit GlyphEncoded(name, traumaEcho, timestamp);
    }

    function getFigure(string memory name) internal view returns (
        string memory, string memory, string memory, bool, uint256
    ) {
        ImmunityNullifier.NullifiedFigure[] memory figures = nullifier.getAllNullified();
        for (uint i = 0; i < figures.length; i++) {
            if (keccak256(bytes(figures[i].name)) == keccak256(bytes(name))) {
                return (
                    figures[i].name,
                    figures[i].country,
                    figures[i].reason,
                    figures[i].isNullified,
                    figures[i].timestamp
                );
            }
        }
        revert("Figure not found");
    }

    function getAllGlyphs() external view returns (ImpactGlyph[] memory) {
        return glyphs;
    }
}
