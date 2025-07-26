// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title vin-revelation-scroll - Archetype reveal contract for symbolic defense and transformation
/// @author VINVIN
contract VinRevelationScroll {
    address public steward;

    struct Archetype {
        bytes32 glyph;
        bool cloaked;
        string revealedTrait;
    }

    Archetype[] public knownArchetypes;

    event ArchetypeRevealed(bytes32 glyph, string revealedTrait);
    event RevelationPulseTriggered(uint256 time, uint256 intensity);

    modifier onlySteward() {
        require(msg.sender == steward, "Only scroll steward may perform revelation.");
        _;
    }

    constructor() {
        steward = msg.sender;

        // Pre-seeded with known glyphs
        _reveal("ShadowWitch", "Hides ancestral truth");
        _reveal("ChaosWitch", "Dodges order with disruption");
        _reveal("MirrorWitch", "Reflects suppressed identity");
    }

    function _reveal(bytes32 glyph, string memory trait) internal {
        knownArchetypes.push(Archetype(glyph, true, trait));
        emit ArchetypeRevealed(glyph, trait);
    }

    function uncloakArchetype(bytes32 glyph) external onlySteward {
        for (uint256 i = 0; i < knownArchetypes.length; i++) {
            if (knownArchetypes[i].glyph == glyph && knownArchetypes[i].cloaked) {
                knownArchetypes[i].cloaked = false;
                emit ArchetypeRevealed(glyph, knownArchetypes[i].revealedTrait);
            }
        }
    }

    function revelationPulse(uint256 intensity) external onlySteward {
        emit RevelationPulseTriggered(block.timestamp, intensity);
    }

    function getArchetypes() external view returns (Archetype[] memory) {
        return knownArchetypes;
    }
}
