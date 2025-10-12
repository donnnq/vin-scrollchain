// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title NarrativeContainmentProtocolDAO
 * @dev Emotionally tagged smart contract to log narrative breaches,
 * misinformation sightings, and containment rituals — scrollchain-sealed clarity.
 */

contract NarrativeContainmentProtocolDAO {
    address public steward;

    struct Containment {
        address initiator;
        string platform;
        string breachType;
        string emotionalTag;
        uint256 timestamp;
    }

    Containment[] public containments;

    event NarrativeContainmentLogged(address indexed initiator, string platform, string breachType, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log narrative containment");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logContainment(address initiator, string memory platform, string memory breachType, string memory emotionalTag) external onlySteward {
        containments.push(Containment({
            initiator: initiator,
            platform: platform,
            breachType: breachType,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit NarrativeContainmentLogged(initiator, platform, breachType, emotionalTag, block.timestamp);
    }

    function getContainmentByIndex(uint256 index) external view returns (address initiator, string memory platform, string memory breachType, string memory emotionalTag, uint256 timestamp) {
        require(index < containments.length, "Scrollstorm index out of bounds");
        Containment memory c = containments[index];
        return (c.initiator, c.platform, c.breachType, c.emotionalTag, c.timestamp);
    }
}
