// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract WageEquityBroadcastManifest {
    address public validator;

    struct Broadcast {
        string organization;
        string action;
        string impact;
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

    function broadcastAction(string memory _organization, string memory _action, string memory _impact) public onlyValidator {
        broadcasts.push(Broadcast(_organization, _action, _impact, block.timestamp));
    }

    function getBroadcast(uint256 index) public view returns (Broadcast memory) {
        return broadcasts[index];
    }

    function totalBroadcasts() public view returns (uint256) {
        return broadcasts.length;
    }
}
