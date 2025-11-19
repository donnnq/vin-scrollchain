// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CommuteComfortTimestampLedger {
    address public validator;

    struct Comfort {
        string location;
        string feature;
        string comfortTag;
        uint256 timestamp;
    }

    Comfort[] public comforts;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logComfort(string memory _location, string memory _feature, string memory _tag) public onlyValidator {
        comforts.push(Comfort(_location, _feature, _tag, block.timestamp));
    }

    function getComfort(uint256 index) public view returns (Comfort memory) {
        return comforts[index];
    }

    function totalComforts() public view returns (uint256) {
        return comforts.length;
    }
}
