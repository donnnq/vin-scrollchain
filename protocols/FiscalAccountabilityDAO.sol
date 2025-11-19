// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract FiscalAccountabilityDAO {
    address public validator;

    struct Spending {
        string department;
        string project;
        string spendingTag;
        uint256 amount;
        uint256 timestamp;
    }

    Spending[] public records;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logSpending(string memory _department, string memory _project, string memory _tag, uint256 _amount) public onlyValidator {
        records.push(Spending(_department, _project, _tag, _amount, block.timestamp));
    }

    function getSpending(uint256 index) public view returns (Spending memory) {
        return records[index];
    }

    function totalRecords() public view returns (uint256) {
        return records.length;
    }
}
