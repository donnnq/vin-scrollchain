// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CommunalDataPrivacyBroadcastProtocol {
    address public validator;

    struct Broadcast {
        string policy;
        string dignityTag;
        string communalImpact;
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

    function broadcastPolicy(string memory _policy, string memory _tag, string memory _impact) public onlyValidator {
        broadcasts.push(Broadcast(_policy, _tag, _impact, block.timestamp));
    }

    function getBroadcast(uint256 index) public view returns (Broadcast memory) {
        return broadcasts[index];
    }

    function totalBroadcasts() public view returns (uint256) {
        return broadcasts.length;
    }
}
