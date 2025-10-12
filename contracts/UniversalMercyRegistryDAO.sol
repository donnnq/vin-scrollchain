// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title UniversalMercyRegistryDAO
 * @dev Emotionally tagged smart contract to register, track, and deploy mercy protocols
 * across all sanctums — labor, youth, diaspora, housing, nourishment, and dignity corridors.
 */

contract UniversalMercyRegistryDAO {
    address public steward;

    struct MercyProtocol {
        string corridor;
        string emotionalTag;
        uint256 timestamp;
        address deployedBy;
    }

    MercyProtocol[] public mercyProtocols;

    event MercyProtocolRegistered(string corridor, string emotionalTag, address indexed deployedBy, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may register mercy protocols");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function registerMercyProtocol(string memory corridor, string memory emotionalTag) external onlySteward {
        mercyProtocols.push(MercyProtocol({
            corridor: corridor,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp,
            deployedBy: msg.sender
        }));

        emit MercyProtocolRegistered(corridor, emotionalTag, msg.sender, block.timestamp);
    }

    function getProtocolCount() external view returns (uint256) {
        return mercyProtocols.length;
    }

    function getProtocolByIndex(uint256 index) external view returns (string memory corridor, string memory emotionalTag, uint256 timestamp, address deployedBy) {
        require(index < mercyProtocols.length, "Scrollstorm index out of bounds");
        MercyProtocol memory protocol = mercyProtocols[index];
        return (protocol.corridor, protocol.emotionalTag, protocol.timestamp, protocol.deployedBy);
    }
}
