// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CommunalAccountabilityBroadcastProtocol {
    address public validator;

    struct Broadcast {
        string message;
        string resonance;
        uint256 timestamp;
    }

    Broadcast[] public broadcasts;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function broadcastMessage(string memory _message, string memory _resonance) public onlyValidator {
        broadcasts.push(Broadcast(_message, _resonance, block.timestamp));
    }

    function getBroadcast(uint256 index) public view returns (Broadcast memory) {
        return broadcasts[index];
    }

    function totalBroadcasts() public view returns (uint256) {
        return broadcasts.length;
    }
}
