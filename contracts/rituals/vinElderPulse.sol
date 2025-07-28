// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title vinElderPulse
 * @dev Registers seniors, facilitates barangay surveys, and issues care credits for medicine, groceries, hospital access, and trust-based loans.
 */
contract vinElderPulse {
    address public admin;
    struct Elder {
        bool registered;
        uint256 careCredits;
        uint256 loanBalance;
        bool priorityFreeHospital;
    }

    mapping(address => Elder) public elders;
    event ElderRegistered(address indexed elder);
    event CreditsGranted(address indexed elder, uint256 amount, string purpose);
    event LoanGranted(address indexed elder, uint256 amount);
    event RepaymentReceived(address indexed elder, uint256 amount);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Admin only");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function registerElder(address elderAddress) external onlyAdmin {
        elders[elderAddress].registered = true;
        elders[elderAddress].priorityFreeHospital = true;
        emit ElderRegistered(elderAddress);
    }

    function grantCareCredits(address elder, uint256 amount, string calldata purpose) external onlyAdmin {
        require(elders[elder].registered, "Not registered");
        elders[elder].careCredits += amount;
        emit CreditsGranted(elder, amount, purpose);
    }

    function requestLoan(address elder) external onlyAdmin {
        require(elders[elder].registered, "Not registered");
        require(elders[elder].loanBalance == 0, "Pending loan must be cleared");
        elders[elder].loanBalance = 100000;
        emit LoanGranted(elder, 100000);
    }

    function repayLoan(address elder, uint256 amount) external onlyAdmin {
        require(elders[elder].loanBalance >= amount, "Overpayment not allowed");
        elders[elder].loanBalance -= amount;
        emit RepaymentReceived(elder, amount);
    }

    function checkStatus(address elder) external view returns (Elder memory) {
        return elders[elder];
    }
}
