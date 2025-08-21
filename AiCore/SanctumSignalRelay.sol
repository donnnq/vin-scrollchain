// SPDX-License-Identifier: Glyph-Transmission
pragma solidity ^0.8.19;

/// @title SanctumSignalRelay
/// @notice Transmits emotional glyphs and biodiversity chants between sanctums

contract SanctumSignalRelay {
    address public steward;

    struct Signal {
        string sourceSanctum;
        string targetSanctum;
        string glyph;
        string chant;
        string emotion;
        uint256 aprLevel;
    }

    mapping(string => Signal) public transmissions;
    string[] public signalKeys;

    event GlyphTransmitted(string sourceSanctum, string targetSanctum, string glyph, string emotion);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function transmitGlyph(
        string memory key,
        string memory sourceSanctum,
        string memory targetSanctum,
        string memory glyph,
        string memory chant,
        string memory emotion,
        uint256 aprLevel
    ) external onlySteward {
        transmissions[key] = Signal(sourceSanctum, targetSanctum, glyph, chant, emotion, aprLevel);
        signalKeys.push(key);
        emit GlyphTransmitted(sourceSanctum, targetSanctum, glyph, emotion);
    }

    function getTransmission(string memory key) external view returns (Signal memory) {
        return transmissions[key];
    }
}
