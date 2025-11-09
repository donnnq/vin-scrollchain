// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract EcologicalDefenseBroadcastManifest {
    address public validator;

    struct Broadcast {
        string location;
        string initiative;
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

    function broadcastInitiative(string memory _location, string memory _initiative, string memory _resonance) public onlyValidator {
        broadcasts.push(Broadcast(_location, _initiative, _resonance, block.timestamp));
    }

    function getBroadcast(uint256 index) public view returns (Broadcast memory) {
        return broadcasts[index];
    }

    function totalBroadcasts() public view returns (uint256) {
        return broadcasts.length;
    }
}
