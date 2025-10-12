// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title YouthSanctumUpgradeDAO
 * @dev Emotionally tagged smart contract to log youth sanctum upgrades,
 * educational deployments, and safety rituals — scrollchain-sealed dignity.
 */

contract YouthSanctumUpgradeDAO {
    address public steward;

    struct Sanctum {
        address initiator;
        string region;
        string upgradeType;
        string emotionalTag;
        uint256 timestamp;
    }

    Sanctum[] public sanctums;

    event YouthSanctumLogged(address indexed initiator, string region, string upgradeType, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log youth sanctum upgrades");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logSanctum(address initiator, string memory region, string memory upgradeType, string memory emotionalTag) external onlySteward {
        sanctums.push(Sanctum({
            initiator: initiator,
            region: region,
            upgradeType: upgradeType,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit YouthSanctumLogged(initiator, region, upgradeType, emotionalTag, block.timestamp);
    }

    function getSanctumByIndex(uint256 index) external view returns (address initiator, string memory region, string memory upgradeType, string memory emotionalTag, uint256 timestamp) {
        require(index < sanctums.length, "Scrollstorm index out of bounds");
        Sanctum memory s = sanctums[index];
        return (s.initiator, s.region, s.upgradeType, s.emotionalTag, s.timestamp);
    }
}
