// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract PlanetaryPayrollTimestampChain {
    address public validator;

    struct Payroll {
        address employee;
        uint256 amount;
        string currency;
        string dignityTag;
        uint256 timestamp;
    }

    Payroll[] public payrolls;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logPayroll(address _employee, uint256 _amount, string memory _currency, string memory _tag) public onlyValidator {
        payrolls.push(Payroll(_employee, _amount, _currency, _tag, block.timestamp));
    }

    function getPayroll(uint256 index) public view returns (Payroll memory) {
        return payrolls[index];
    }

    function totalPayrolls() public view returns (uint256) {
        return payrolls.length;
    }
}
