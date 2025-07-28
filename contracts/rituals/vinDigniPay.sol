// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title vinDigniPay
 * @dev Enforces a ₱1000/day minimum wage across registered sectors and monitors compliance.
 */
contract vinDigniPay {
    address public creator;
    uint256 public dailyMinimum = 1000;
    mapping(address => bool) public registeredEmployers;
    mapping(address => uint256) public wageLedger;
    event WageUpdated(address indexed employer, uint256 amount);
    event EmployerRegistered(address indexed employer);
    event ViolationReported(address indexed employer, string reason);

    constructor() {
        creator = msg.sender;
    }

    function registerEmployer(address employer) external {
        require(msg.sender == creator, "Only creator can register.");
        registeredEmployers[employer] = true;
        emit EmployerRegistered(employer);
    }

    function updateWage(address employee, uint256 wage) external {
        require(registeredEmployers[msg.sender], "Unregistered employer.");
        require(wage >= dailyMinimum, "Wage below legal minimum.");
        wageLedger[employee] += wage;
        emit WageUpdated(msg.sender, wage);
    }

    function reportViolation(address employer, string calldata reason) external {
        emit ViolationReported(employer, reason);
    }

    function setDailyMinimum(uint256 newMinimum) external {
        require(msg.sender == creator, "Unauthorized.");
        dailyMinimum = newMinimum;
    }
}
