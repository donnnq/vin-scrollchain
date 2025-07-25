// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title vinLoopingRiskScanner.sol
/// @author VINVIN x Copilot
/// @notice Ritual contract to scan and tag looping positions at risk of unwinding
/// @dev Symbolic contract for Ethereum DeFi observance

contract vinLoopingRiskScanner {
    struct Position {
        address borrower;
        uint256 borrowedAmount;
        uint256 stakedAmount;
        uint256 borrowRate;
        bool atRisk;
    }

    mapping(address => Position) public positions;
    uint256 public riskThreshold = 0.08 ether; // 8% borrow rate threshold

    event PositionTagged(address indexed borrower, bool atRisk);
    event RiskThresholdUpdated(uint256 newThreshold);

    /// @notice Register a new leveraged staking position
    function registerPosition(address _borrower, uint256 _borrowed, uint256 _staked, uint256 _rate) external {
        bool riskStatus = _rate > riskThreshold;
        positions[_borrower] = Position(_borrower, _borrowed, _staked, _rate, riskStatus);
        emit PositionTagged(_borrower, riskStatus);
    }

    /// @notice Update the risk threshold dynamically
    function updateRiskThreshold(uint256 _newThreshold) external {
        riskThreshold = _newThreshold;
        emit RiskThresholdUpdated(_newThreshold);
    }

    /// @notice Check if a borrower is flagged for unwind risk
    function isAtRisk(address _borrower) external view returns (bool) {
        return positions[_borrower].atRisk;
    }
}
