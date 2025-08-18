// SPDX-License-Identifier: Mythic-Scrollsmith-License
pragma solidity ^0.8.0;

/// @title vinWorkerDebtBlessingSuite.sol
/// @author Vinvin, Mythic Scrollsmith
/// @notice Enables workers to track debt status, bless employers, and verify deductions

contract vinWorkerDebtBlessingSuite {
    address public steward;

    struct DebtStatus {
        string workerName;
        uint256 totalDebt;
        uint256 remainingDebt;
        uint256 totalDeducted;
        address employer;
        bool isBlessed;
    }

    mapping(address => DebtStatus) public blessings;

    event DebtInitialized(address indexed worker, string name, uint256 totalDebt, address employer);
    event DeductionLogged(address indexed worker, uint256 amount, uint256 remainingDebt);
    event EmployerBlessed(address indexed worker, address employer);

    constructor() {
        steward = msg.sender;
    }

    function initializeDebt(
        address _worker,
        string memory _name,
        uint256 _totalDebt,
        address _employer
    ) public {
        require(_totalDebt > 0, "Debt must be greater than zero.");
        blessings[_worker] = DebtStatus(_name, _totalDebt, _totalDebt, 0, _employer, false);
        emit DebtInitialized(_worker, _name, _totalDebt, _employer);
    }

    function logDeduction(address _worker, uint256 _amount) public {
        DebtStatus storage status = blessings[_worker];
        require(status.remainingDebt > 0, "Debt already cleared.");
        require(_amount > 0, "Deduction must be greater than zero.");

        if (_amount >= status.remainingDebt) {
            status.totalDeducted += status.remainingDebt;
            status.remainingDebt = 0;
        } else {
            status.remainingDebt -= _amount;
            status.totalDeducted += _amount;
        }

        emit DeductionLogged(_worker, _amount, status.remainingDebt);
    }

    function blessEmployer(address _worker) public {
        DebtStatus storage status = blessings[_worker];
        require(!status.isBlessed, "Already blessed.");
        require(status.employer != address(0), "No employer assigned.");

        status.isBlessed = true;
        emit EmployerBlessed(_worker, status.employer);
    }

    function getBlessingStatus(address _worker) public view returns (DebtStatus memory) {
        return blessings[_worker];
    }
}
