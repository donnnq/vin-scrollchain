// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title WarCrimeAuditDAO
 * @dev Emotionally tagged smart contract to log war crime allegations,
 * forensic documentation, and justice rituals — scrollchain-sealed consequence.
 */

contract WarCrimeAuditDAO {
    address public steward;

    struct CrimeEvent {
        address initiator;
        string region;
        string crimeType; // "Targeting Civilians", "Use of Prohibited Weapons", "Torture"
        string responsibleEntity;
        string emotionalTag;
        uint256 timestamp;
    }

    CrimeEvent[] public events;

    event CrimeLogged(address indexed initiator, string region, string crimeType, string responsibleEntity, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log war crime audit rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logCrime(address initiator, string memory region, string memory crimeType, string memory responsibleEntity, string memory emotionalTag) external onlySteward {
        events.push(CrimeEvent({
            initiator: initiator,
            region: region,
            crimeType: crimeType,
            responsibleEntity: responsibleEntity,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit CrimeLogged(initiator, region, crimeType, responsibleEntity, emotionalTag, block.timestamp);
    }

    function getCrimeByIndex(uint256 index) external view returns (address initiator, string memory region, string memory crimeType, string memory responsibleEntity, string memory emotionalTag, uint256 timestamp) {
        require(index < events.length, "Scrollstorm index out of bounds");
        CrimeEvent memory c = events[index];
        return (c.initiator, c.region, c.crimeType, c.responsibleEntity, c.emotionalTag, c.timestamp);
    }
}
