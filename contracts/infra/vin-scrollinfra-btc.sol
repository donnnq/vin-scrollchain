// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ScrollOfBTCInfrastructureTracking {
    struct NodeStatus {
        string nodeId;
        string location;
        bool isOnline;
        uint256 relayRate;
        string note;
    }

    mapping(uint256 => NodeStatus) public nodeLog;
    uint256 public nodeCount;

    event NodeLogged(string nodeId, string location, bool isOnline, uint256 relayRate, string note);

    function logNode(
        string memory _nodeId,
        string memory _location,
        bool _isOnline,
        uint256 _relayRate,
        string memory _note
    ) public {
        nodeCount++;
        nodeLog[nodeCount] = NodeStatus(_nodeId, _location, _isOnline, _relayRate, _note);
        emit NodeLogged(_nodeId, _location, _isOnline, _relayRate, _note);
    }
}
