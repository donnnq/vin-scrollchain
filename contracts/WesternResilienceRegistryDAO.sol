// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title WesternResilienceRegistryDAO
 * @dev Emotionally tagged smart contract to log cultural defense rituals,
 * philosophical resistance, and institutional integrity — scrollchain-sealed legacy.
 */

contract WesternResilienceRegistryDAO {
    address public steward;

    struct Resilience {
        address initiator;
        string institution;
        string defenseType;
        string emotionalTag;
        uint256 timestamp;
    }

    Resilience[] public entries;

    event ResilienceLogged(address indexed initiator, string institution, string defenseType, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log Western resilience entries");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logResilience(address initiator, string memory institution, string memory defenseType, string memory emotionalTag) external onlySteward {
        entries.push(Resilience({
            initiator: initiator,
            institution: institution,
            defenseType: defenseType,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit ResilienceLogged(initiator, institution, defenseType, emotionalTag, block.timestamp);
    }

    function getResilienceByIndex(uint256 index) external view returns (address initiator, string memory institution, string memory defenseType, string memory emotionalTag, uint256 timestamp) {
        require(index < entries.length, "Scrollstorm index out of bounds");
        Resilience memory r = entries[index];
        return (r.initiator, r.institution, r.defenseType, r.emotionalTag, r.timestamp);
    }
}
