// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract EducationalEquityDAO {
    address public validator;

    struct Equity {
        string school;
        string resource;
        uint256 amount;
        string dignityTag;
        uint256 timestamp;
    }

    Equity[] public equities;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logEquity(string memory _school, string memory _resource, uint256 _amount, string memory _tag) public onlyValidator {
        equities.push(Equity(_school, _resource, _amount, _tag, block.timestamp));
    }

    function getEquity(uint256 index) public view returns (Equity memory) {
        return equities[index];
    }

    function totalEquities() public view returns (uint256) {
        return equities.length;
    }
}
