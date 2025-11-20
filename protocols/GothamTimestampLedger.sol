// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract GothamTimestampLedger {
    address public validator;

    struct PatrolLog {
        string district;
        string action;
        string justiceTag;
        uint256 timestamp;
    }

    PatrolLog[] public logs;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logPatrol(string memory _district, string memory _action, string memory _tag) public onlyValidator {
        logs.push(PatrolLog(_district, _action, _tag, block.timestamp));
    }

    function getPatrol(uint256 index) public view returns (PatrolLog memory) {
        return logs[index];
    }

    function totalLogs() public view returns (uint256) {
        return logs.length;
    }
}
