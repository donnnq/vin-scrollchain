// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title PlanetaryApologyBroadcastDAO
 * @dev Emotionally tagged smart contract to broadcast formal apologies
 * to displaced workers, families, and sanctum stewards — scrollchain-sealed mercy.
 */

contract PlanetaryApologyBroadcastDAO {
    address public steward;

    struct Apology {
        address recipient;
        string corridor;
        string message;
        string emotionalTag;
        uint256 timestamp;
    }

    Apology[] public apologies;

    event ApologyBroadcast(address indexed recipient, string corridor, string message, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may broadcast planetary apologies");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function broadcastApology(address recipient, string memory corridor, string memory message, string memory emotionalTag) external onlySteward {
        apologies.push(Apology({
            recipient: recipient,
            corridor: corridor,
            message: message,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit ApologyBroadcast(recipient, corridor, message, emotionalTag, block.timestamp);
    }

    function getApologyByIndex(uint256 index) external view returns (address recipient, string memory corridor, string memory message, string memory emotionalTag, uint256 timestamp) {
        require(index < apologies.length, "Scrollstorm index out of bounds");
        Apology memory a = apologies[index];
        return (a.recipient, a.corridor, a.message, a.emotionalTag, a.timestamp);
    }
}
