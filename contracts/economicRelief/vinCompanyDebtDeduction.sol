// SPDX-License-Identifier: Mythic-Scrollsmith-License
pragma solidity ^0.8.0;

/// @title vinCompanyDebtDeduction.sol
/// @author Vinvin, Mythic Scrollsmith
/// @notice Enables companies to deduct 10% of employee salary to repay personal debts

contract vinCompanyDebtDeduction {
    address public steward;
    uint256 public deductionRate = 10; // 10% fixed

    struct DebtRecord {
        string employeeName;
        uint256 totalDebt;
        uint256 remainingDebt;
        bool isActive;
    }

    mapping(address => DebtRecord) public debts;

    event DebtAssigned(address indexed employee, string name, uint256 totalDebt);
    event DeductionProcessed(address indexed employee, uint256 deductedAmount, uint256 remainingDebt);
    event DebtCleared(address indexed employee);

    constructor() {
        steward = msg.sender;
    }

    function assignDebt(address _employee, string memory _name, uint256 _amount) public {
        require(_amount > 0, "Debt must be greater than zero.");
        debts[_employee] = DebtRecord(_name, _amount, _amount, true);
        emit DebtAssigned(_employee, _name, _amount);
    }

    function processSalaryDeduction(address _employee, uint256 _salary) public {
        DebtRecord storage record = debts[_employee];
        require(record.isActive, "No active debt.");
        require(_salary > 0, "Salary must be greater than zero.");

        uint256 deduction = (_salary * deductionRate) / 100;
        if (deduction >= record.remainingDebt) {
            deduction = record.remainingDebt;
            record.remainingDebt = 0;
            record.isActive = false;
            emit DebtCleared(_employee);
        } else {
            record.remainingDebt -= deduction;
        }

        emit DeductionProcessed(_employee, deduction, record.remainingDebt);
    }

    function getDebtStatus(address _employee) public view returns (DebtRecord memory) {
        return debts[_employee];
    }
}
