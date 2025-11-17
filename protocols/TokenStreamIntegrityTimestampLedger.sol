// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract TokenStreamIntegrityTimestampLedger {
    address public validator;

    struct Stream {
        string modelName;
        string outputHash;
        bool isCorrupted;
        string integrityTag;
        uint256 timestamp;
    }

    Stream[] public streams;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logStream(string memory _model, string memory _hash, bool _corrupted, string memory _tag) public onlyValidator {
        streams.push(Stream(_model, _hash, _corrupted, _tag, block.timestamp));
    }

    function getStream(uint256 index) public view returns (Stream memory) {
        return streams[index];
    }

    function totalStreams() public view returns (uint256) {
        return streams.length;
    }
}
