// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract MountainGuardianTimestampRegistry {
    address public validator;

    struct GuardianAct {
        string range;
        string action;
        string impact;
        uint256 timestamp;
    }

    GuardianAct[] public acts;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logAct(string memory _range, string memory _action, string memory _impact) public onlyValidator {
        acts.push(GuardianAct(_range, _action, _impact, block.timestamp));
    }

    function getAct(uint256 index) public view returns (GuardianAct memory) {
        return acts[index];
    }

    function totalActs() public view returns (uint256) {
        return acts.length;
    }
}
