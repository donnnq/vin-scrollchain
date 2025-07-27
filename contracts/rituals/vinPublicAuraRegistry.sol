// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title vinPublicAuraRegistry.sol
/// @notice Symbolically records aura impressions of public figures based on perceived conduct.

contract vinPublicAuraRegistry {
    address public registrar;

    struct AuraEntry {
        string figureName;
        string contextNote;
        uint8 humilityScore; // 0-10 scale
        bool eligibleFor ritualThanks;
    }

    AuraEntry[] public registry;

    event AuraLogged(string figureName, uint8 humilityScore, string contextNote);

    constructor() {
        registrar = msg.sender;
    }

    modifier onlyRegistrar() {
        require(msg.sender == registrar, "You lack scroll authority 🙅");
        _;
    }

    function logAura(
        string calldata figureName,
        string calldata contextNote,
        uint8 humilityScore
    ) external onlyRegistrar {
        bool thanksRequired = humilityScore >= 7 ? true : false;
        registry.push(AuraEntry(figureName, contextNote, humilityScore, thanksRequired));
        emit AuraLogged(figureName, humilityScore, contextNote);
    }

    function readAura(uint256 index) external view returns (AuraEntry memory) {
        return registry[index];
    }
}
