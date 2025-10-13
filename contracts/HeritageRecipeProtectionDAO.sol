// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract HeritageRecipeProtectionDAO {
    address public steward;

    struct Recipe {
        string dishName;
        string originRegion;
        string protectionType; // "Ancestral", "Indigenous", "Diaspora"
        string emotionalTag;
        uint256 timestamp;
    }

    Recipe[] public recipes;

    event RecipeLogged(
        string dishName,
        string originRegion,
        string protectionType,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log heritage recipe rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logRecipe(
        string memory dishName,
        string memory originRegion,
        string memory protectionType,
        string memory emotionalTag
    ) external onlySteward {
        recipes.push(Recipe({
            dishName: dishName,
            originRegion: originRegion,
            protectionType: protectionType,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit RecipeLogged(dishName, originRegion, protectionType, emotionalTag, block.timestamp);
    }

    function getRecipeByIndex(uint256 index) external view returns (
        string memory dishName,
        string memory originRegion,
        string memory protectionType,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < recipes.length, "Scrollstorm index out of bounds");
        Recipe memory r = recipes[index];
        return (
            r.dishName,
            r.originRegion,
            r.protectionType,
            r.emotionalTag,
            r.timestamp
        );
    }
}
