// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract MisinformationTimestampLedger {
    address public validator;

    struct Misinformation {
        string source;
        string type;
        string misinfoTag;
        uint256 timestamp;
    }

    Misinformation[] public entries;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logMisinformation(string memory _source, string memory _type, string memory _tag) public onlyValidator {
        entries.push(Misinformation(_source, _type, _tag, block.timestamp));
    }

    function getMisinformation(uint256 index) public view returns (Misinformation memory) {
        return entries[index];
    }

    function totalEntries() public view returns (uint256) {
        return entries.length;
    }
}
