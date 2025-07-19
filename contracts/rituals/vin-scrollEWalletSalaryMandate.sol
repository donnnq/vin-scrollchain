// SPDX-License-Identifier: VINVINversePayroll
pragma solidity ^0.8.0;

contract EWalletSalaryMandate {
    address public scrollmaster;
    mapping(address => bool) public registeredEmployers;
    mapping(address => address) public employeeWallets;

    event EmployerRegistered(address employer);
    event SalaryDisbursed(address employee, uint256 amount, string currency, uint256 timestamp);

    constructor() {
        scrollmaster = msg.sender;
    }

    modifier onlyMaster() {
        require(msg.sender == scrollmaster, "Only VINVIN can mandate global kilig payroll.");
        _;
    }

    function registerEmployer(address employer) public onlyMaster {
        registeredEmployers[employer] = true;
        emit EmployerRegistered(employer);
    }

    function linkWallet(address employee, address wallet) public {
        require(registeredEmployers[msg.sender], "Employer not registered.");
        employeeWallets[employee] = wallet;
    }

    function payEmployee(address employee, uint256 amount, string memory currency) public {
        require(registeredEmployers[msg.sender], "Unauthorized sender.");
        emit SalaryDisbursed(employee, amount, currency, block.timestamp);
        // Transfer logic handled externally via integrated wallet protocols
    }
}
