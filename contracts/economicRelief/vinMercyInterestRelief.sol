// SPDX-License-Identifier: Mythic-Scrollsmith-License
pragma solidity ^0.8.0;

/// @title vinMercyInterestRelief.sol
/// @notice Caps interest rates to 1% or 0.5%, enables installment payments, and audits lenders

contract vinMercyInterestRelief {
    address public steward;
    uint256 public maxInterestRate; // in basis points (e.g., 100 = 1%, 50 = 0.5%)

    struct DebtPlan {
        string borrowerName;
        uint256 principal;
        uint256 interestRate; // basis points
        uint256 totalInstallments;
        uint256 paidInstallments;
        bool isActive;
    }

    mapping(address => DebtPlan) public plans;

    event PlanCreated(address indexed borrower, string name, uint256 principal, uint256 interestRate, uint256 installments);
    event InstallmentPaid(address indexed borrower, uint256 amount, uint256 remainingInstallments);
    event PlanCompleted(address indexed borrower);

    constructor(uint256 _maxRate) {
        steward = msg.sender;
        maxInterestRate = _maxRate; // e.g., 50 = 0.5%
    }

    function createPlan(
        address _borrower,
        string memory _name,
        uint256 _principal,
        uint256 _interestRate,
        uint256 _installments
    ) public {
        require(_interestRate <= maxInterestRate, "Interest exceeds mercy threshold.");
        require(_installments > 0, "Installments must be greater than zero.");

        plans[_borrower] = DebtPlan(_name, _principal, _interestRate, _installments, 0, true);
        emit PlanCreated(_borrower, _name, _principal, _interestRate, _installments);
    }

    function payInstallment(address _borrower) public payable {
        DebtPlan storage plan = plans[_borrower];
        require(plan.isActive, "Plan inactive.");
        require(plan.paidInstallments < plan.totalInstallments, "Plan already completed.");

        uint256 totalDue = plan.principal + ((plan.principal * plan.interestRate) / 10000);
        uint256 installmentAmount = totalDue / plan.totalInstallments;
        require(msg.value >= installmentAmount, "Insufficient payment.");

        plan.paidInstallments++;

        if (plan.paidInstallments == plan.totalInstallments) {
            plan.isActive = false;
            emit PlanCompleted(_borrower);
        }

        emit InstallmentPaid(_borrower, msg.value, plan.totalInstallments - plan.paidInstallments);
    }

    function getPlan(address _borrower) public view returns (DebtPlan memory) {
        return plans[_borrower];
    }
}
