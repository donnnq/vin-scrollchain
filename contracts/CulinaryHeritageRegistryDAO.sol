// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title CulinaryHeritageRegistryDAO
 * @dev Emotionally tagged smart contract to log ancestral recipes,
 * flavor sovereignty rituals, and heritage protection — scrollchain-sealed consequence.
 */

contract CulinaryHeritageRegistryDAO {
    address public steward;

    struct RecipeEvent {
        address initiator;
        string dishName;
        string originCulture;
        string registryType; // "Protection", "Revival", "Documentation"
        string emotionalTag;
        uint256 timestamp;
    }

    RecipeEvent[] public events;

    event RecipeLogged(address indexed initiator, string dishName, string originCulture, string registryType, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log culinary heritage rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logRecipe(address initiator, string memory dishName, string memory originCulture, string memory registryType, string memory emotionalTag) external onlySteward {
        events.push(RecipeEvent({
            initiator: initiator,
            dishName: dishName,
            originCulture: originCulture,
            registryType: registryType,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit RecipeLogged(initiator, dishName, originCulture, registryType, emotionalTag, block.timestamp);
    }

    function getRecipeByIndex(uint256 index) external view returns (address initiator, string memory dishName, string memory originCulture, string memory registryType, string memory emotionalTag, uint256 timestamp) {
        require(index < events.length, "Scrollstorm index out of bounds");
        RecipeEvent memory r = events[index];
        return (r.initiator, r.dishName, r.originCulture, r.registryType, r.emotionalTag, r.timestamp);
    }
}
