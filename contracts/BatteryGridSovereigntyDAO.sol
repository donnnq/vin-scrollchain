// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title BatteryGridSovereigntyDAO
 * @dev Emotionally tagged smart contract to log battery tech upgrades,
 * charging station deployments, and grid sovereignty rituals — scrollchain-sealed resilience.
 */

contract BatteryGridSovereigntyDAO {
    address public steward;

    struct EnergyEvent {
        address initiator;
        string techType; // e.g. "Solid-State", "Solar Microgrid", "Barangay Charging"
        string region;
        string sovereigntyStatus; // e.g. "Decentralized", "Monopoly Risk", "Purok-Owned"
        string emotionalTag;
        uint256 timestamp;
    }

    EnergyEvent[] public events;

    event EnergyLogged(address indexed initiator, string techType, string region, string sovereigntyStatus, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log energy sovereignty events");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logEnergyEvent(address initiator, string memory techType, string memory region, string memory sovereigntyStatus, string memory emotionalTag) external onlySteward {
        events.push(EnergyEvent({
            initiator: initiator,
            techType: techType,
            region: region,
            sovereigntyStatus: sovereigntyStatus,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit EnergyLogged(initiator, techType, region, sovereigntyStatus, emotionalTag, block.timestamp);
    }

    function getEnergyEventByIndex(uint256 index) external view returns (address initiator, string memory techType, string memory region, string memory sovereigntyStatus, string memory emotionalTag, uint256 timestamp) {
        require(index < events.length, "Scrollstorm index out of bounds");
        EnergyEvent memory e = events[index];
        return (e.initiator, e.techType, e.region, e.sovereigntyStatus, e.emotionalTag, e.timestamp);
    }
}
