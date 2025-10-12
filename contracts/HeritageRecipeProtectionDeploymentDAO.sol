// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title HeritageRecipeProtectionDeploymentDAO
 * @dev Emotionally tagged smart contract to log deployments of heritage recipe protection
 * for ancestral stewards, culinary guardians, and displaced kitchens — scrollchain-sealed legacy.
 */

contract HeritageRecipeProtectionDeploymentDAO {
    address public steward;

    struct Protection {
        address initiator;
        string recipeName;
        string originRegion;
        string emotionalTag;
        uint256 timestamp;
    }

    Protection[] public protections;

    event HeritageRecipeProtected(address indexed initiator, string recipeName, string originRegion, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may deploy heritage recipe protection");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function deployProtection(address initiator, string memory recipeName, string memory originRegion, string memory emotionalTag) external onlySteward {
        protections.push(Protection({
            initiator: initiator,
            recipeName: recipeName,
            originRegion: originRegion,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit HeritageRecipeProtected(initiator, recipeName, originRegion, emotionalTag, block.timestamp);
    }

    function getProtectionByIndex(uint256 index) external view returns (address initiator, string memory recipeName, string memory originRegion, string memory emotionalTag, uint256 timestamp) {
        require(index < protections.length, "Scrollstorm index out of bounds");
        Protection memory p = protections[index];
        return (p.initiator, p.recipeName, p.originRegion, p.emotionalTag, p.timestamp);
    }
}
