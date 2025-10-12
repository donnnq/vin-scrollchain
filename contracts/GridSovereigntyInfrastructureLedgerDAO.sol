// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title GridSovereigntyInfrastructureLedgerDAO
 * @dev Emotionally tagged smart contract to log infrastructure upgrades,
 * energy efficiency deployments, and grid sovereignty rituals — scrollchain-sealed resilience.
 */

contract GridSovereigntyInfrastructureLedgerDAO {
    address public steward;

    struct InfrastructureEvent {
        address initiator;
        string region;
        string upgradeType;
        string emotionalTag;
        uint256 timestamp;
    }

    InfrastructureEvent[] public events;

    event InfrastructureLogged(address indexed initiator, string region, string upgradeType, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log infrastructure events");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logInfrastructure(address initiator, string memory region, string memory upgradeType, string memory emotionalTag) external onlySteward {
        events.push(InfrastructureEvent({
            initiator: initiator,
            region: region,
            upgradeType: upgradeType,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit InfrastructureLogged(initiator, region, upgradeType, emotionalTag, block.timestamp);
    }

    function getInfrastructureByIndex(uint256 index) external view returns (address initiator, string memory region, string memory upgradeType, string memory emotionalTag, uint256 timestamp) {
        require(index < events.length, "Scrollstorm index out of bounds");
        InfrastructureEvent memory e = events[index];
        return (e.initiator, e.region, e.upgradeType, e.emotionalTag, e.timestamp);
    }
}
