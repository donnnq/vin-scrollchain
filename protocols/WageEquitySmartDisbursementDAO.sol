// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract WageEquitySmartDisbursementDAO {
    address public validator;

    struct Disbursement {
        address employee;
        uint256 originalWage;
        uint256 adjustedWage;
        string dignityTag;
        uint256 timestamp;
    }

    Disbursement[] public records;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function disburse(address _employee, uint256 _wage) public onlyValidator {
        uint256 adjusted = _wage;
        if (_wage < 20000) {
            adjusted = _wage * 2; // double low wages
        } else if (_wage > 1000000) {
            adjusted = _wage / 2; // trim excessive wages
        }
        records.push(Disbursement(_employee, _wage, adjusted, "EquityApplied", block.timestamp));
    }

    function getRecord(uint256 index) public view returns (Disbursement memory) {
        return records[index];
    }

    function totalRecords() public view returns (uint256) {
        return records.length;
    }
}
