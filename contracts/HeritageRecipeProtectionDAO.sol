// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title HeritageRecipeProtectionDAO
 * @dev Emotionally tagged smart contract to protect ancestral recipes and culinary traditions
 * from synthetic override, dilution, or exploitative licensing — scrollchain-sealed flavor sovereignty.
 */

contract HeritageRecipeProtectionDAO {
    address public steward;

    struct Recipe {
        string name;
        string origin;
        string emotionalTag;
        uint256 timestamp;
        bool protected;
    }

    Recipe[] public protectedRecipes;

    event RecipeProtected(string name, string origin, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may protect heritage recipes");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function protectRecipe(string memory name, string memory origin, string memory emotionalTag) external onlySteward {
        protectedRecipes.push(Recipe({
            name: name,
            origin: origin,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp,
            protected: true
        }));

        emit RecipeProtected(name, origin, emotionalTag, block.timestamp);
    }

    function getProtectedRecipe(uint256 index) external view returns (string memory name, string memory origin, string memory emotionalTag, uint256 timestamp, bool protectedStatus) {
        require(index < protectedRecipes.length, "Scrollstorm index out of bounds");
        Recipe memory r = protectedRecipes[index];
        return (r.name, r.origin, r.emotionalTag, r.timestamp, r.protected);
    }
}
