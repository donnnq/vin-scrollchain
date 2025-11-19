// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract EnvironmentalConsequenceDAO {
    address public validator;

    struct Consequence {
        string location;
        string action;
        string species;
        string consequenceTag;
        uint256 timestamp;
    }

    Consequence[] public logs;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logConsequence(string memory _location, string memory _action, string memory _species, string memory _tag) public onlyValidator {
        logs.push(Consequence(_location, _action, _species, _tag, block.timestamp));
    }

    function getConsequence(uint256 index) public view returns (Consequence memory) {
        return logs[index];
    }

    function totalLogs() public view returns (uint256) {
        return logs.length;
    }
}
