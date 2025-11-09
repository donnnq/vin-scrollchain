// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract EmotionalExitTimestampLedger {
    address public validator;

    struct Exit {
        address employee;
        string reason;
        string emotionalTag;
        uint256 timestamp;
    }

    Exit[] public exits;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logExit(address _employee, string memory _reason, string memory _tag) public onlyValidator {
        exits.push(Exit(_employee, _reason, _tag, block.timestamp));
    }

    function getExit(uint256 index) public view returns (Exit memory) {
        return exits[index];
    }

    function totalExits() public view returns (uint256) {
        return exits.length;
    }
}
