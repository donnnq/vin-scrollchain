// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract FermentationChoreographyProtocolDAO {
    address public steward;

    struct FermentEvent {
        string recipeName;
        string biomeRegion;
        string choreographyType; // "Wild", "Starter-Based", "Salt-Cured", "Sun-Dried"
        string emotionalTag;
        uint256 timestamp;
    }

    FermentEvent[] public events;

    event FermentLogged(
        string recipeName,
        string biomeRegion,
        string choreographyType,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log fermentation choreography rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logFerment(
        string memory recipeName,
        string memory biomeRegion,
        string memory choreographyType,
        string memory emotionalTag
    ) external onlySteward {
        events.push(FermentEvent({
            recipeName: recipeName,
            biomeRegion: biomeRegion,
            choreographyType: choreographyType,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit FermentLogged(recipeName, biomeRegion, choreographyType, emotionalTag, block.timestamp);
    }

    function getFermentByIndex(uint256 index) external view returns (
        string memory recipeName,
        string memory biomeRegion,
        string memory choreographyType,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        FermentEvent memory f = events[index];
        return (
            f.recipeName,
            f.biomeRegion,
            f.choreographyType,
            f.emotionalTag,
            f.timestamp
        );
    }
}
