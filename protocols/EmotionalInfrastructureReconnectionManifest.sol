// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract EmotionalInfrastructureReconnectionManifest {
    address public validator;

    struct Reconnection {
        string barangay;
        string ritual;
        string resonance;
        uint256 timestamp;
    }

    Reconnection[] public reconnections;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function broadcastReconnection(string memory _barangay, string memory _ritual, string memory _resonance) public onlyValidator {
        reconnections.push(Reconnection(_barangay, _ritual, _resonance, block.timestamp));
    }

    function getReconnection(uint256 index) public view returns (Reconnection memory) {
        return reconnections[index];
    }

    function totalReconnections() public view returns (uint256) {
        return reconnections.length;
    }
}
