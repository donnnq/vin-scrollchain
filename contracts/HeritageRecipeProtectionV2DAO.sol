// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title HeritageRecipeProtectionV2DAO
 * @dev Upgraded emotionally tagged smart contract to protect ancestral recipes
 * with validator-grade signature hashing and scrollchain audit trails — flavor sovereignty sealed.
 */

contract HeritageRecipeProtectionV2DAO {
    address public steward;

    struct Recipe {
        string name;
        string origin;
        string emotionalTag;
        bytes32 ancestralHash;
        uint256 timestamp;
        bool protectedStatus;
    }

    Recipe[] public protectedRecipes;

    event RecipeProtected(string name, string origin, string emotionalTag, bytes32 ancestralHash, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may protect heritage recipes");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function protectRecipe(string memory name, string memory origin, string memory emotionalTag) external onlySteward {
        bytes32 hash = keccak256(abi.encodePacked(name, origin, emotionalTag, block.timestamp));
        protectedRecipes.push(Recipe({
            name: name,
            origin: origin,
            emotionalTag: emotionalTag,
            ancestralHash: hash,
            timestamp: block.timestamp,
            protectedStatus: true
        }));

        emit RecipeProtected(name, origin, emotionalTag, hash, block.timestamp);
    }

    function getProtectedRecipe(uint256 index) external view returns (string memory name, string memory origin, string memory emotionalTag, bytes32 ancestralHash, uint256 timestamp, bool protectedStatus) {
        require(index < protectedRecipes.length, "Scrollstorm index out of bounds");
        Recipe memory r = protectedRecipes[index];
        return (r.name, r.origin, r.emotionalTag, r.ancestralHash, r.timestamp, r.protectedStatus);
    }
}
