// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ConsumerProtectionDAO {
    address public validator;

    struct Case {
        string product;
        string violation;
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

    function logCase(string memory _product, string memory _violation, string memory _penalty) public onlyValidator {
        cases.push(Case(_product, _violation, _penalty, block.timestamp));
    }

    function getCase(uint256 index) public view returns (Case memory) {
        return cases[index];
    }

    function totalCases() public view returns (uint256) {
        return cases.length;
    }
}
