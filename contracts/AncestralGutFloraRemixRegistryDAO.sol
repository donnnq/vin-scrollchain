// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract AncestralGutFloraRemixRegistryDAO {
    address public steward;

    struct RemixEvent {
        string microbeName;
        string remixSource; // "Ferment", "Herb", "Soil"
        string originCulture;
        string remixType; // "Hybrid", "Rewilded", "Decolonized"
        string emotionalTag;
        uint256 timestamp;
    }

    RemixEvent[] public events;

    event RemixLogged(
        string microbeName,
        string remixSource,
        string originCulture,
        string remixType,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log gut flora remix rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logRemix(
        string memory microbeName,
        string memory remixSource,
        string memory originCulture,
        string memory remixType,
        string memory emotionalTag
    ) external onlySteward {
        events.push(RemixEvent({
            microbeName: microbeName,
            remixSource: remixSource,
            originCulture: originCulture,
            remixType: remixType,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit RemixLogged(microbeName, remixSource, originCulture, remixType, emotionalTag, block.timestamp);
    }

    function getRemixByIndex(uint256 index) external view returns (
        string memory microbeName,
        string memory remixSource,
        string memory originCulture,
        string memory remixType,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        RemixEvent memory r = events[index];
        return (
            r.microbeName,
            r.remixSource,
            r.originCulture,
            r.remixType,
            r.emotionalTag,
            r.timestamp
        );
    }
}
