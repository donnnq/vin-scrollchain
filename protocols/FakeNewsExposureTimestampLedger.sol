// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract FakeNewsExposureTimestampLedger {
    address public validator;

    struct Exposure {
        string claim;
        string source;
        string debunk;
        uint256 timestamp;
    }

    Exposure[] public exposures;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logExposure(string memory _claim, string memory _source, string memory _debunk) public onlyValidator {
        exposures.push(Exposure(_claim, _source, _debunk, block.timestamp));
    }

    function getExposure(uint256 index) public view returns (Exposure memory) {
        return exposures[index];
    }

    function totalExposures() public view returns (uint256) {
        return exposures.length;
    }
}
