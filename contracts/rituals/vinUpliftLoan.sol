// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title vinUpliftLoan
 * @dev Allows registered workers to access ₱100,000 trust-based loans. Repayment increases future loan eligibility.
 */
contract vinUpliftLoan {
    address public admin;
    uint256 public maxLoan = 100000;
    mapping(address => uint256) public loanBalance;
    mapping(address => uint256) public karmaScore;
    event LoanGranted(address indexed worker, uint256 amount);
    event LoanRepaid(address indexed worker, uint256 amount);
    event KarmaUpdated(address indexed worker, uint256 score);

    constructor() {
        admin = msg.sender;
    }

    function requestLoan() external {
        require(loanBalance[msg.sender] == 0, "Existing loan must be repaid.");
        loanBalance[msg.sender] = maxLoan;
        emit LoanGranted(msg.sender, maxLoan);
    }

    function repayLoan(uint256 amount) external {
        require(loanBalance[msg.sender] > 0, "No active loan.");
        require(amount <= loanBalance[msg.sender], "Overpayment not allowed.");
        loanBalance[msg.sender] -= amount;
        karmaScore[msg.sender] += amount / 1000; // ₱1K repaid = +1 karma
        emit LoanRepaid(msg.sender, amount);
        emit KarmaUpdated(msg.sender, karmaScore[msg.sender]);
    }

    function calculateNextLoan(address worker) public view returns (uint256) {
        return maxLoan + (karmaScore[worker] * 10000); // Karma boosts next loan ceiling
    }
}
