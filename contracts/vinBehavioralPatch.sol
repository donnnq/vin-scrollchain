// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title vinBehavioralPatch.sol — Enforces dignified spending thresholds based on verified income tiers
contract vinBehavioralPatch {
    address public controller;
    uint public baseLimit = 3_000 ether;      // PHP/month default (scaled to wei)
    uint public premiumLimit = 10_000 ether;  // PHP/month for 100k+ income earners

    mapping(address => uint) public verifiedIncome;
    mapping(address => uint) public monthlyCashIn;
    mapping(address => uint) public lastCashInTimestamp;

    event IncomeVerified(address indexed user, uint incomeAmount);
    event CashInAttempted(address indexed user, uint amount, bool success);
    event SpendingThrottled(address indexed user, string reason);
    event LimitsUpdated(uint newBaseLimit, uint newPremiumLimit);

    modifier onlyController() {
        require(msg.sender == controller, "Forbidden ritual: not controller");
        _;
    }

    constructor() {
        controller = msg.sender;
    }

    /// @notice Verify income off-chain then call on-chain to update tier
    function verifyIncome(address user, uint incomeAmount) external onlyController {
        verifiedIncome[user] = incomeAmount;
        emit IncomeVerified(user, incomeAmount);
    }

    /// @notice User deposits PHP (in wei) up to their tiered monthly cap
    function cashIn() external payable {
        _resetIfNewMonth(msg.sender);

        uint cap = _currentCap(msg.sender);
        uint attempted = monthlyCashIn[msg.sender] + msg.value;
        if (attempted > cap) {
            emit SpendingThrottled(
                msg.sender,
                "Deposit exceeds monthly cap for your income tier"
            );
            emit CashInAttempted(msg.sender, msg.value, false);
            revert("Monthly cap exceeded");
        }

        // accept deposit
        monthlyCashIn[msg.sender] = attempted;
        lastCashInTimestamp[msg.sender] = block.timestamp;
        emit CashInAttempted(msg.sender, msg.value, true);
    }

    /// @notice Computes the cap based on verified income
    function _currentCap(address user) internal view returns (uint) {
        if (verifiedIncome[user] >= 100_000) {
            return premiumLimit;
        } else {
            return baseLimit;
        }
    }

    /// @notice Resets the monthly counter if 30 days have passed
    function _resetIfNewMonth(address user) internal {
        if (block.timestamp >= lastCashInTimestamp[user] + 30 days) {
            monthlyCashIn[user] = 0;
        }
    }

    /// @notice Controller may adjust caps to adapt to new policy
    function updateLimits(uint newBase, uint newPremium) external onlyController {
        baseLimit = newBase;
        premiumLimit = newPremium;
        emit LimitsUpdated(newBase, newPremium);
    }

    /// @notice Emergency withdrawal of stuck ETH by controller
    function emergencyWithdraw(address payable to) external onlyController {
        uint balance = address(this).balance;
        to.transfer(balance);
    }
}
