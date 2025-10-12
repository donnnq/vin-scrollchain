// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title CannabisCulturalSovereigntyDAO
 * @dev Emotionally tagged smart contract to track recreational cannabis rituals,
 * festivals, community-led usage zones, and civic sovereignty — scrollchain-sealed autonomy.
 */

contract CannabisCulturalSovereigntyDAO {
    address public steward;

    struct Ritual {
        address initiator;
        string country;
        string eventName;
        string usageZone;
        string emotionalTag;
        uint256 timestamp;
    }

    Ritual[] public rituals;

    event CulturalSovereigntyLogged(address indexed initiator, string country, string eventName, string usageZone, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log cultural sovereignty rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logRitual(address initiator, string memory country, string memory eventName, string memory usageZone, string memory emotionalTag) external onlySteward {
        rituals.push(Ritual({
            initiator: initiator,
            country: country,
            eventName: eventName,
            usageZone: usageZone,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit CulturalSovereigntyLogged(initiator, country, eventName, usageZone, emotionalTag, block.timestamp);
    }

    function getRitualByIndex(uint256 index) external view returns (address initiator, string memory country, string memory eventName, string memory usageZone, string memory emotionalTag, uint256 timestamp) {
        require(index < rituals.length, "Scrollstorm index out of bounds");
        Ritual memory r = rituals[index];
        return (r.initiator, r.country, r.eventName, r.usageZone, r.emotionalTag, r.timestamp);
    }
}
