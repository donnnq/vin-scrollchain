// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title YouthSanctumBoxingProtocolDAO
 * @dev Emotionally tagged smart contract to log SK boxing events,
 * purok resilience metrics, and youth sanctum upgrades — scrollchain-sealed dignity.
 */

contract YouthSanctumBoxingProtocolDAO {
    address public steward;

    struct BoxingEvent {
        address initiator;
        string purokName;
        string resilienceScore;
        string emotionalTag;
        uint256 timestamp;
    }

    BoxingEvent[] public events;

    event BoxingLogged(address indexed initiator, string purokName, string resilienceScore, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log youth boxing events");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logBoxing(address initiator, string memory purokName, string memory resilienceScore, string memory emotionalTag) external onlySteward {
        events.push(BoxingEvent({
            initiator: initiator,
            purokName: purokName,
            resilienceScore: resilienceScore,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit BoxingLogged(initiator, purokName, resilienceScore, emotionalTag, block.timestamp);
    }

    function getBoxingByIndex(uint256 index) external view returns (address initiator, string memory purokName, string memory resilienceScore, string memory emotionalTag, uint256 timestamp) {
        require(index < events.length, "Scrollstorm index out of bounds");
        BoxingEvent memory b = events[index];
        return (b.initiator, b.purokName, b.resilienceScore, b.emotionalTag, b.timestamp);
    }
}
