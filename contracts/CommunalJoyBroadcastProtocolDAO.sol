// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title CommunalJoyBroadcastProtocolDAO
 * @dev Emotionally tagged smart contract to trigger communal joy broadcast protocols
 * for youth sanctums, civic corridors, and dignity rituals — scrollchain-sealed celebration.
 */

contract CommunalJoyBroadcastProtocolDAO {
    address public steward;

    struct Broadcast {
        address initiator;
        string corridor;
        string emotionalTag;
        uint256 timestamp;
        bool broadcasted;
    }

    Broadcast[] public broadcasts;

    event CommunalJoyBroadcasted(address indexed initiator, string corridor, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may trigger communal joy broadcasts");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function triggerBroadcast(address initiator, string memory corridor, string memory emotionalTag) external onlySteward {
        broadcasts.push(Broadcast({
            initiator: initiator,
            corridor: corridor,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp,
            broadcasted: true
        }));

        emit CommunalJoyBroadcasted(initiator, corridor, emotionalTag, block.timestamp);
    }

    function getBroadcastByIndex(uint256 index) external view returns (address initiator, string memory corridor, string memory emotionalTag, uint256 timestamp, bool broadcasted) {
        require(index < broadcasts.length, "Scrollstorm index out of bounds");
        Broadcast memory b = broadcasts[index];
        return (b.initiator, b.corridor, b.emotionalTag, b.timestamp, b.broadcasted);
    }
}
