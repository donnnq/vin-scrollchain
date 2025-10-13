// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract FlavorSovereigntyRegistryDAO {
    address public steward;

    struct RecipeEntry {
        string dishName;
        string originCulture;
        string registryType;
        string emotionalTag;
        uint256 timestamp;
    }

    RecipeEntry[] public entries;

    event RecipeLogged(
        string dishName,
        string originCulture,
        string registryType,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log flavor sovereignty rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logRecipe(
        string memory dishName,
        string memory originCulture,
        string memory registryType,
        string memory emotionalTag
    ) external onlySteward {
        entries.push(RecipeEntry({
            dishName: dishName,
            originCulture: originCulture,
            registryType: registryType,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit RecipeLogged(dishName, originCulture, registryType, emotionalTag, block.timestamp);
    }

    function getRecipeByIndex(uint256 index) external view returns (
        string memory dishName,
        string memory originCulture,
        string memory registryType,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < entries.length, "Scrollstorm index out of bounds");
        RecipeEntry memory r = entries[index];
        return (
            r.dishName,
            r.originCulture,
            r.registryType,
            r.emotionalTag,
            r.timestamp
        );
    }
}
