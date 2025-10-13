// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title DiasporaRegistryDAO
 * @dev Emotionally tagged smart contract to log ancestral tracking,
 * displacement records, and cultural preservation — scrollchain-sealed dignity.
 */

contract DiasporaRegistryDAO {
    address public steward;

    struct DiasporaEvent {
        address initiator;
        string originRegion;
        string hostCountry;
        string registryType; // "Cultural", "Genealogical", "Legal"
        string emotionalTag;
        uint256 timestamp;
    }

    DiasporaEvent[] public events;

    event DiasporaLogged(address indexed initiator, string originRegion, string hostCountry, string registryType, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log diaspora registry rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logDiaspora(address initiator, string memory originRegion, string memory hostCountry, string memory registryType, string memory emotionalTag) external onlySteward {
        events.push(DiasporaEvent({
            initiator: initiator,
            originRegion: originRegion,
            hostCountry: hostCountry,
            registryType: registryType,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit DiasporaLogged(initiator, originRegion, hostCountry, registryType, emotionalTag, block.timestamp);
    }

    function getDiasporaByIndex(uint256 index) external view returns (address initiator, string memory originRegion, string memory hostCountry, string memory registryType, string memory emotionalTag, uint256 timestamp) {
        require(index < events.length, "Scrollstorm index out of bounds");
        DiasporaEvent memory d = events[index];
        return (d.initiator, d.originRegion, d.hostCountry, d.registryType, d.emotionalTag, d.timestamp);
    }
}
