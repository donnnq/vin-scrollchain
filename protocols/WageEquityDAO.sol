// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract WageEquityDAO {
    address public validator;

    struct Wage {
        address employee;
        uint256 amount;
        string equityTag;
        uint256 timestamp;
    }

    Wage[] public wages;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logWage(address _employee, uint256 _amount, string memory _tag) public onlyValidator {
        wages.push(Wage(_employee, _amount, _tag, block.timestamp));
    }

    function getWage(uint256 index) public view returns (Wage memory) {
        return wages[index];
    }

    function totalWages() public view returns (uint256) {
        return wages.length;
    }
}
