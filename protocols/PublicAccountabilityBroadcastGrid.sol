// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicAccountabilityBroadcastGrid {
    address public steward;

    struct BroadcastNode {
        string nodeID;
        string corridor;
        string broadcastType;
        string emotionalTag;
    }

    BroadcastNode[] public grid;

    event BroadcastActivated(string nodeID, string corridor, string broadcastType, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function activateBroadcast(
        string memory nodeID,
        string memory corridor,
        string memory broadcastType,
        string memory emotionalTag
    ) public onlySteward {
        grid.push(BroadcastNode(nodeID, corridor, broadcastType, emotionalTag));
        emit BroadcastActivated(nodeID, corridor, broadcastType, emotionalTag);
    }
}
