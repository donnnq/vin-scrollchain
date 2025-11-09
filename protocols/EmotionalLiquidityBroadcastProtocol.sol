// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract EmotionalLiquidityBroadcastProtocol {
    address public validator;

    struct Broadcast {
        string source;
        uint256 amount;
        string emotionalTag;
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

    function broadcastLiquidity(string memory _source, uint256 _amount, string memory _tag) public onlyValidator {
        broadcasts.push(Broadcast(_source, _amount, _tag, block.timestamp));
    }

    function getBroadcast(uint256 index) public view returns (Broadcast memory) {
        return broadcasts[index];
    }

    function totalBroadcasts() public view returns (uint256) {
        return broadcasts.length;
    }
}
