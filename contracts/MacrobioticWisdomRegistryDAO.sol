// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract MacrobioticWisdomRegistryDAO {
    address public steward;

    struct WisdomEntry {
        string foodName;
        string healingProperty;
        string originCulture;
        string emotionalTag;
        uint256 timestamp;
    }

    WisdomEntry[] public entries;

    event WisdomLogged(
        string foodName,
        string healingProperty,
        string originCulture,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log macrobiotic wisdom rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logWisdom(
        string memory foodName,
        string memory healingProperty,
        string memory originCulture,
        string memory emotionalTag
    ) external onlySteward {
        entries.push(WisdomEntry({
            foodName: foodName,
            healingProperty: healingProperty,
            originCulture: originCulture,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit WisdomLogged(foodName, healingProperty, originCulture, emotionalTag, block.timestamp);
    }

    function getWisdomByIndex(uint256 index) external view returns (
        string memory foodName,
        string memory healingProperty,
        string memory originCulture,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < entries.length, "Scrollstorm index out of bounds");
        WisdomEntry memory w = entries[index];
        return (
            w.foodName,
            w.healingProperty,
            w.originCulture,
            w.emotionalTag,
            w.timestamp
        );
    }
}
