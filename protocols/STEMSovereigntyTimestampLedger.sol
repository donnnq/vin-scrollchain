// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract STEMSovereigntyTimestampLedger {
    address public validator;

    struct Initiative {
        string program;
        string impact;
        uint256 participants;
        uint256 timestamp;
    }

    Initiative[] public initiatives;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logInitiative(string memory _program, string memory _impact, uint256 _participants) public onlyValidator {
        initiatives.push(Initiative(_program, _impact, _participants, block.timestamp));
    }

    function getInitiative(uint256 index) public view returns (Initiative memory) {
        return initiatives[index];
    }

    function totalInitiatives() public view returns (uint256) {
        return initiatives.length;
    }
}
