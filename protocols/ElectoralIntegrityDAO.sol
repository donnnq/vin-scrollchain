// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ElectoralIntegrityDAO {
    address public validator;

    struct Case {
        string actor;
        string violation;
        string subpoenaTag;
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

    function logCase(string memory _actor, string memory _violation, string memory _tag) public onlyValidator {
        cases.push(Case(_actor, _violation, _tag, block.timestamp));
    }

    function getCase(uint256 index) public view returns (Case memory) {
        return cases[index];
    }

    function totalCases() public view returns (uint256) {
        return cases.length;
    }
}
