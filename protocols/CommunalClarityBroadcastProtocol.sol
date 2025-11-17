// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CommunalClarityBroadcastProtocol {
    address public validator;

    struct Broadcast {
        string aiModel;
        string query;
        string clarityTag;
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

    function broadcastClarity(string memory _model, string memory _query, string memory _tag, string memory _resonance) public onlyValidator {
        broadcasts.push(Broadcast(_model, _query, _tag, _resonance, block.timestamp));
    }

    function getBroadcast(uint256 index) public view returns (Broadcast memory) {
        return broadcasts[index];
    }

    function totalBroadcasts() public view returns (uint256) {
        return broadcasts.length;
    }
}
