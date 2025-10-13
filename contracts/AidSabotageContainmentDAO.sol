// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title AidSabotageContainmentDAO
 * @dev Emotionally tagged smart contract to log sabotage attempts,
 * aid disruption audits, and containment rituals — scrollchain-sealed consequence.
 */

contract AidSabotageContainmentDAO {
    address public steward;

    struct SabotageEvent {
        address initiator;
        string region;
        string sabotageType; // "Diversion", "Destruction", "Blockade"
        string responsibleEntity;
        string emotionalTag;
        uint256 timestamp;
    }

    SabotageEvent[] public events;

    event SabotageLogged(address indexed initiator, string region, string sabotageType, string responsibleEntity, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log aid sabotage containment rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logSabotage(address initiator, string memory region, string memory sabotageType, string memory responsibleEntity, string memory emotionalTag) external onlySteward {
        events.push(SabotageEvent({
            initiator: initiator,
            region: region,
            sabotageType: sabotageType,
            responsibleEntity: responsibleEntity,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit SabotageLogged(initiator, region, sabotageType, responsibleEntity, emotionalTag, block.timestamp);
    }

    function getSabotageByIndex(uint256 index) external view returns (address initiator, string memory region, string memory sabotageType, string memory responsibleEntity, string memory emotionalTag, uint256 timestamp) {
        require(index < events.length, "Scrollstorm index out of bounds");
        SabotageEvent memory s = events[index];
        return (s.initiator, s.region, s.sabotageType, s.responsibleEntity, s.emotionalTag, s.timestamp);
    }
}
