// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title EnergySigil - Visualizes symbolic power of energy pacts and sovereign surges
/// @author Vinvin
/// @notice Links pipeline deals to animated sigils representing influence, flow, and civic resonance

contract EnergySigil {
    address public scrollsmith;

    struct Sigil {
        string name;
        string sourceProvince;
        string destination;
        string energyType;
        uint256 flowRate; // barrels/day or equivalent
        string glyph; // symbolic representation
        uint256 timestamp;
    }

    Sigil[] public sigils;

    event SigilForged(string name, string glyph, uint256 flowRate);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not authorized");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    /// @notice Forge a new energy sigil
    function forgeSigil(
        string calldata name,
        string calldata sourceProvince,
        string calldata destination,
        string calldata energyType,
        uint256 flowRate,
        string calldata glyph
    ) external onlyScrollsmith {
        sigils.push(Sigil(name, sourceProvince, destination, energyType, flowRate, glyph, block.timestamp));
        emit SigilForged(name, glyph, flowRate);
    }

    /// @notice View all forged sigils
    function getAllSigils() external view returns (Sigil[] memory) {
        return sigils;
    }
}
