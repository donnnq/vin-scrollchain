// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract DisinformationExposureTimestampLedger {
    address public validator;

    struct Exposure {
        string actor;
        string disinfoClaim;
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

    function logExposure(string memory _actor, string memory _claim, string memory _debunk) public onlyValidator {
        exposures.push(Exposure(_actor, _claim, _debunk, block.timestamp));
    }

    function getExposure(uint256 index) public view returns (Exposure memory) {
        return exposures[index];
    }

    function totalExposures() public view returns (uint256) {
        return exposures.length;
    }
}
