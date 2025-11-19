// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract WalkabilityTimestampLedger {
    address public validator;

    struct Walkability {
        string location;
        string feature;
        string walkabilityTag;
        uint256 timestamp;
    }

    Walkability[] public logs;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logWalkability(string memory _location, string memory _feature, string memory _tag) public onlyValidator {
        logs.push(Walkability(_location, _feature, _tag, block.timestamp));
    }

    function getWalkability(uint256 index) public view returns (Walkability memory) {
        return logs[index];
    }

    function totalLogs() public view returns (uint256) {
        return logs.length;
    }
}
