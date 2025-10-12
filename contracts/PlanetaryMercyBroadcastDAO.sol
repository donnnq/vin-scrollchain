// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title PlanetaryMercyBroadcastDAO
 * @dev Emotionally tagged smart contract to broadcast acts of mercy, dignity, and sanctuary
 * across the scrollchain for planetary consequence and communal resonance.
 */

contract PlanetaryMercyBroadcastDAO {
    address public steward;

    struct MercySignal {
        address sender;
        string corridor;
        string emotionalTag;
        string message;
        uint256 timestamp;
    }

    MercySignal[] public mercySignals;

    event MercySignalBroadcasted(address indexed sender, string corridor, string emotionalTag, string message, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may broadcast mercy signals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function broadcastMercySignal(string memory corridor, string memory emotionalTag, string memory message) external onlySteward {
        mercySignals.push(MercySignal({
            sender: msg.sender,
            corridor: corridor,
            emotionalTag: emotionalTag,
            message: message,
            timestamp: block.timestamp
        }));

        emit MercySignalBroadcasted(msg.sender, corridor, emotionalTag, message, block.timestamp);
    }

    function getSignalCount() external view returns (uint256) {
        return mercySignals.length;
    }

    function getSignalByIndex(uint256 index) external view returns (address sender, string memory corridor, string memory emotionalTag, string memory message, uint256 timestamp) {
        require(index < mercySignals.length, "Scrollstorm index out of bounds");
        MercySignal memory signal = mercySignals[index];
        return (signal.sender, signal.corridor, signal.emotionalTag, signal.message, signal.timestamp);
    }
}
