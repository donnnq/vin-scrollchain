// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract FearGreedSentimentBroadcastManifest {
    address public validator;

    struct Sentiment {
        uint8 indexValue;
        string category;
        uint256 timestamp;
    }

    Sentiment[] public readings;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function broadcastSentiment(uint8 _value, string memory _category) public onlyValidator {
        readings.push(Sentiment(_value, _category, block.timestamp));
    }

    function getReading(uint256 index) public view returns (Sentiment memory) {
        return readings[index];
    }

    function totalReadings() public view returns (uint256) {
        return readings.length;
    }
}
