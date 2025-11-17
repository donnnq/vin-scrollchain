// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract PayrollTransparencyTimestampLedger {
    address public validator;

    struct Payroll {
        string department;
        uint256 totalAmount;
        string transparencyTag;
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

    function logPayroll(string memory _department, uint256 _totalAmount, string memory _tag) public onlyValidator {
        payrolls.push(Payroll(_department, _totalAmount, _tag, block.timestamp));
    }

    function getPayroll(uint256 index) public view returns (Payroll memory) {
        return payrolls[index];
    }

    function totalPayrolls() public view returns (uint256) {
        return payrolls.length;
    }
}
