// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract HumanOversightDAO {
    address public validator;

    struct OversightLog {
        string action;
        string reviewer;
        string resonance;
        uint256 timestamp;
    }

    OversightLog[] public logs;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logOversight(string memory _action, string memory _reviewer, string memory _resonance) public onlyValidator {
        logs.push(OversightLog(_action, _reviewer, _resonance, block.timestamp));
    }

    function getOversight(uint256 index) public view returns (OversightLog memory) {
        return logs[index];
    }

    function totalLogs() public view returns (uint256) {
        return logs.length;
    }
}
