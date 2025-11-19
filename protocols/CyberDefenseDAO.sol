// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CyberDefenseDAO {
    address public validator;

    struct DefenseLog {
        string system;
        string action;
        string defenseTag;
        uint256 timestamp;
    }

    DefenseLog[] public logs;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logDefense(string memory _system, string memory _action, string memory _tag) public onlyValidator {
        logs.push(DefenseLog(_system, _action, _tag, block.timestamp));
    }

    function getDefense(uint256 index) public view returns (DefenseLog memory) {
        return logs[index];
    }

    function totalLogs() public view returns (uint256) {
        return logs.length;
    }
}
