// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract PlanetaryDigestionChoreographyDAO {
    address public steward;

    struct DigestionEvent {
        string foodName;
        string biomeRegion;
        string digestionType; // "Macrobiotic", "Fermented", "Raw", "Cooked"
        string planetaryEffect; // "Gut Harmony", "Climate Sync", "Cultural Resonance"
        string emotionalTag;
        uint256 timestamp;
    }

    DigestionEvent[] public events;

    event DigestionLogged(
        string foodName,
        string biomeRegion,
        string digestionType,
        string planetaryEffect,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log planetary digestion rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logDigestion(
        string memory foodName,
        string memory biomeRegion,
        string memory digestionType,
        string memory planetaryEffect,
        string memory emotionalTag
    ) external onlySteward {
        events.push(DigestionEvent({
            foodName: foodName,
            biomeRegion: biomeRegion,
            digestionType: digestionType,
            planetaryEffect: planetaryEffect,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit DigestionLogged(foodName, biomeRegion, digestionType, planetaryEffect, emotionalTag, block.timestamp);
    }

    function getDigestionByIndex(uint256 index) external view returns (
        string memory foodName,
        string memory biomeRegion,
        string memory digestionType,
        string memory planetaryEffect,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        DigestionEvent memory d = events[index];
        return (
            d.foodName,
            d.biomeRegion,
            d.digestionType,
            d.planetaryEffect,
            d.emotionalTag,
            d.timestamp
        );
    }
}
