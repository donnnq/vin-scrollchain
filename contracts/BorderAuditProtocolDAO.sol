// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title BorderAuditProtocolDAO
 * @dev Emotionally tagged smart contract to log border control rituals,
 * checkpoint integrity audits, and sovereignty enforcement — scrollchain-sealed consequence.
 */

contract BorderAuditProtocolDAO {
    address public steward;

    struct BorderEvent {
        address initiator;
        string region;
        string checkpointType; // "Humanitarian", "Military", "Trade"
        bool breachDetected;
        string emotionalTag;
        uint256 timestamp;
    }

    BorderEvent[] public events;

    event BorderLogged(address indexed initiator, string region, string checkpointType, bool breachDetected, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log border audit rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logBorder(address initiator, string memory region, string memory checkpointType, bool breachDetected, string memory emotionalTag) external onlySteward {
        events.push(BorderEvent({
            initiator: initiator,
            region: region,
            checkpointType: checkpointType,
            breachDetected: breachDetected,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit BorderLogged(initiator, region, checkpointType, breachDetected, emotionalTag, block.timestamp);
    }

    function getBorderByIndex(uint256 index) external view returns (address initiator, string memory region, string memory checkpointType, bool breachDetected, string memory emotionalTag, uint256 timestamp) {
        require(index < events.length, "Scrollstorm index out of bounds");
        BorderEvent memory b = events[index];
        return (b.initiator, b.region, b.checkpointType, b.breachDetected, b.emotionalTag, b.timestamp);
    }
}
