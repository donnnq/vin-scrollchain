// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title HeritageRecipeProtectionDAO
 * @dev Emotionally tagged smart contract to log and protect ancestral recipes,
 * culinary rituals, and cultural flavor sanctums — scrollchain-sealed legacy.
 */

contract HeritageRecipeProtectionDAO {
    address public steward;

    struct Recipe {
        address guardian;
        string recipeName;
        string originRegion;
        string emotionalTag;
        uint256 timestamp;
    }

    Recipe[] public recipes;

    event HeritageRecipeLogged(address indexed guardian, string recipeName, string originRegion, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log heritage recipes");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logRecipe(address guardian, string memory recipeName, string memory originRegion, string memory emotionalTag) external onlySteward {
        recipes.push(Recipe({
            guardian: guardian,
            recipeName: recipeName,
            originRegion: originRegion,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit HeritageRecipeLogged(guardian, recipeName, originRegion, emotionalTag, block.timestamp);
    }

    function getRecipeByIndex(uint256 index) external view returns (address guardian, string memory recipeName, string memory originRegion, string memory emotionalTag, uint256 timestamp) {
        require(index < recipes.length, "Scrollstorm index out of bounds");
        Recipe memory r = recipes[index];
        return (r.guardian, r.recipeName, r.originRegion, r.emotionalTag, r.timestamp);
    }
}
