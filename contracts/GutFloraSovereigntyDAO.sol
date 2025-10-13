// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract GutFloraSovereigntyDAO {
    address public steward;

    struct FloraEvent {
        string microbeName;
        string foodSource;
        string biomeRegion;
        string sovereigntyStatus; // "Native", "Invaded", "Restored"
        string emotionalTag;
        uint256 timestamp;
    }

    FloraEvent[] public events;

    event FloraLogged(
        string microbeName,
        string foodSource,
        string biomeRegion,
        string sovereigntyStatus,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log gut flora sovereignty rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logFlora(
        string memory microbeName,
        string memory foodSource,
        string memory biomeRegion,
        string memory sovereigntyStatus,
        string memory emotionalTag
    ) external onlySteward {
        events.push(FloraEvent({
            microbeName: microbeName,
            foodSource: foodSource,
            biomeRegion: biomeRegion,
            sovereigntyStatus: sovereigntyStatus,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit FloraLogged(microbeName, foodSource, biomeRegion, sovereigntyStatus, emotionalTag, block.timestamp);
    }

    function getFloraByIndex(uint256 index) external view returns (
        string memory microbeName,
        string memory foodSource,
        string memory biomeRegion,
        string memory sovereigntyStatus,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        FloraEvent memory f = events[index];
        return (
            f.microbeName,
            f.foodSource,
            f.biomeRegion,
            f.sovereigntyStatus,
            f.emotionalTag,
            f.timestamp
        );
    }
}
