// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CommunityResilienceBroadcastProtocol {
    address public validator;

    struct Broadcast {
        string barangay;
        string act;
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

    function broadcastResilience(string memory _barangay, string memory _act, string memory _resonance) public onlyValidator {
        broadcasts.push(Broadcast(_barangay, _act, _resonance, block.timestamp));
    }

    function getBroadcast(uint256 index) public view returns (Broadcast memory) {
        return broadcasts[index];
    }

    function totalBroadcasts() public view returns (uint256) {
        return broadcasts.length;
    }
}
