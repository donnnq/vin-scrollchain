// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SchoolReopeningEquityDAO {
    address public validator;
    mapping(string => uint256) public schoolFunds;
    uint256 public totalFunded;

    event FundAllocated(string school, uint256 amount, string purpose, uint256 timestamp);

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function allocateFunds(string memory _school, uint256 _amount, string memory _purpose) public onlyValidator {
        schoolFunds[_school] += _amount;
        totalFunded += _amount;
        emit FundAllocated(_school, _amount, _purpose, block.timestamp);
    }

    function getFunds(string memory _school) public view returns (uint256) {
        return schoolFunds[_school];
    }
}
