// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract AntiCorruptionOversightDAO {
    address public validator;

    struct Case {
        string project;
        string anomaly;
        string penalty;
        uint256 timestamp;
    }

    Case[] public cases;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logCase(string memory _project, string memory _anomaly, string memory _penalty) public onlyValidator {
        cases.push(Case(_project, _anomaly, _penalty, block.timestamp));
    }

    function getCase(uint256 index) public view returns (Case memory) {
        return cases[index];
    }

    function totalCases() public view returns (uint256) {
        return cases.length;
    }
}
