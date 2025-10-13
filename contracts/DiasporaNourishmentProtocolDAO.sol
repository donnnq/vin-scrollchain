// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title DiasporaNourishmentProtocolDAO
 * @dev Emotionally tagged smart contract to log ancestral food rituals,
 * cross-border flavor sovereignty, and nourishment equity — scrollchain-sealed dignity.
 */

contract DiasporaNourishmentProtocolDAO {
    address public steward;

    struct NourishmentEvent {
        address initiator;
        string dishName;
        string originRegion;
        string diasporaCommunity;
        string emotionalTag;
        uint256 timestamp;
    }

    NourishmentEvent[] public events;

    event NourishmentLogged(address indexed initiator, string dishName, string originRegion, string diasporaCommunity, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log diaspora nourishment rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logNourishment(address initiator, string memory dishName, string memory originRegion, string memory diasporaCommunity, string memory emotionalTag) external onlySteward {
        events.push(NourishmentEvent({
            initiator: initiator,
            dishName: dishName,
            originRegion: originRegion,
            diasporaCommunity: diasporaCommunity,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit NourishmentLogged(initiator, dishName, originRegion, diasporaCommunity, emotionalTag, block.timestamp);
    }

    function getNourishmentByIndex(uint256 index) external view returns (address initiator, string memory dishName, string memory originRegion, string memory diasporaCommunity, string memory emotionalTag, uint256 timestamp) {
        require(index < events.length, "Scrollstorm index out of bounds");
        NourishmentEvent memory n = events[index];
        return (n.initiator, n.dishName, n.originRegion, n.diasporaCommunity, n.emotionalTag, n.timestamp);
    }
}
