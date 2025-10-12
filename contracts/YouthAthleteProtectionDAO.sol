// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title YouthAthleteProtectionDAO
 * @dev Emotionally tagged smart contract to log youth athlete protections,
 * training sanctum upgrades, and dignity rituals — scrollchain-sealed legacy.
 */

contract YouthAthleteProtectionDAO {
    address public steward;

    struct Protection {
        address initiator;
        string region;
        string sportType;
        string emotionalTag;
        uint256 timestamp;
    }

    Protection[] public protections;

    event YouthAthleteProtectionLogged(address indexed initiator, string region, string sportType, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log youth athlete protections");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logProtection(address initiator, string memory region, string memory sportType, string memory emotionalTag) external onlySteward {
        protections.push(Protection({
            initiator: initiator,
            region: region,
            sportType: sportType,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit YouthAthleteProtectionLogged(initiator, region, sportType, emotionalTag, block.timestamp);
    }

    function getProtectionByIndex(uint256 index) external view returns (address initiator, string memory region, string memory sportType, string memory emotionalTag, uint256 timestamp) {
        require(index < protections.length, "Scrollstorm index out of bounds");
        Protection memory p = protections[index];
        return (p.initiator, p.region, p.sportType, p.emotionalTag, p.timestamp);
    }
}
