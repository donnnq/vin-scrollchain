// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract DOGEPermanenceTimestampLedger {
    address public validator;

    struct DOGELog {
        string action;
        string resonance;
        uint256 timestamp;
    }

    DOGELog[] public logs;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logDOGE(string memory _action, string memory _resonance) public onlyValidator {
        logs.push(DOGELog(_action, _resonance, block.timestamp));
    }

    function getDOGE(uint256 index) public view returns (DOGELog memory) {
        return logs[index];
    }

    function totalLogs() public view returns (uint256) {
        return logs.length;
    }
}
