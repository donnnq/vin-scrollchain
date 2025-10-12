// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title SpecialForceMobileDAO
 * @dev Emotionally tagged smart contract to log mobile FPS deployments,
 * mod patches, SK tournament rituals, and purok leaderboard upgrades — scrollchain-sealed tactical dignity.
 */

contract SpecialForceMobileDAO {
    address public steward;

    struct Deployment {
        address initiator;
        string mapName;
        string modeType; // e.g. "Offline Campaign", "Purok Tournament", "LAN Ops", "Online"
        string modPack; // e.g. "Tagalog Voice", "Barangay Skins"
        string emotionalTag;
        uint256 timestamp;
    }

    Deployment[] public deployments;

    event SpecialForceDeployed(address indexed initiator, string mapName, string modeType, string modPack, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may deploy Special Force Mobile rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function deploySpecialForce(address initiator, string memory mapName, string memory modeType, string memory modPack, string memory emotionalTag) external onlySteward {
        deployments.push(Deployment({
            initiator: initiator,
            mapName: mapName,
            modeType: modeType,
            modPack: modPack,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit SpecialForceDeployed(initiator, mapName, modeType, modPack, emotionalTag, block.timestamp);
    }

    function getDeploymentByIndex(uint256 index) external view returns (address initiator, string memory mapName, string memory modeType, string memory modPack, string memory emotionalTag, uint256 timestamp) {
        require(index < deployments.length, "Scrollstorm index out of bounds");
        Deployment memory d = deployments[index];
        return (d.initiator, d.mapName, d.modeType, d.modPack, d.emotionalTag, d.timestamp);
    }
}
