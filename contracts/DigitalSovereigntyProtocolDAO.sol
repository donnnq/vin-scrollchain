// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title DigitalSovereigntyProtocolDAO
 * @dev Emotionally tagged smart contract to log digital autonomy deployments,
 * infrastructure upgrades, and sovereignty rituals — scrollchain-sealed dignity.
 */

contract DigitalSovereigntyProtocolDAO {
    address public steward;

    struct SovereigntyEvent {
        address initiator;
        string region;
        string upgradeType;
        string emotionalTag;
        uint256 timestamp;
    }

    SovereigntyEvent[] public events;

    event SovereigntyLogged(address indexed initiator, string region, string upgradeType, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log digital sovereignty events");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logEvent(address initiator, string memory region, string memory upgradeType, string memory emotionalTag) external onlySteward {
        events.push(SovereigntyEvent({
            initiator: initiator,
            region: region,
            upgradeType: upgradeType,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit SovereigntyLogged(initiator, region, upgradeType, emotionalTag, block.timestamp);
    }

    function getEventByIndex(uint256 index) external view returns (address initiator, string memory region, string memory upgradeType, string memory emotionalTag, uint256 timestamp) {
        require(index < events.length, "Scrollstorm index out of bounds");
        SovereigntyEvent memory e = events[index];
        return (e.initiator, e.region, e.upgradeType, e.emotionalTag, e.timestamp);
    }
}
