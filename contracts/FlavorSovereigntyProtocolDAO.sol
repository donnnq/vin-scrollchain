// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title FlavorSovereigntyProtocolDAO
 * @dev Emotionally tagged smart contract to log flavor sovereignty deployments,
 * culinary justice rituals, and ancestral taste protections — scrollchain-sealed dignity.
 */

contract FlavorSovereigntyProtocolDAO {
    address public steward;

    struct Sovereignty {
        address initiator;
        string region;
        string flavorType;
        string emotionalTag;
        uint256 timestamp;
    }

    Sovereignty[] public flavors;

    event FlavorSovereigntyLogged(address indexed initiator, string region, string flavorType, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log flavor sovereignty rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logFlavor(address initiator, string memory region, string memory flavorType, string memory emotionalTag) external onlySteward {
        flavors.push(Sovereignty({
            initiator: initiator,
            region: region,
            flavorType: flavorType,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit FlavorSovereigntyLogged(initiator, region, flavorType, emotionalTag, block.timestamp);
    }

    function getFlavorByIndex(uint256 index) external view returns (address initiator, string memory region, string memory flavorType, string memory emotionalTag, uint256 timestamp) {
        require(index < flavors.length, "Scrollstorm index out of bounds");
        Sovereignty memory s = flavors[index];
        return (s.initiator, s.region, s.flavorType, s.emotionalTag, s.timestamp);
    }
}
