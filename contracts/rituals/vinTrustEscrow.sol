// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

/// @title vinTrustEscrow
/// @notice Hold collateral in escrow until trust thresholds are met.
contract vinTrustEscrow is Ownable {
    mapping(address => uint256) public stakedAmount;
    mapping(address => bool)    public isLocked;

    event StakeLocked(address indexed user, uint256 amount);
    event StakeReleased(address indexed user, uint256 amount);
    event StakeSlashed(address indexed user, uint256 amount);

    /// @notice Stake tokens into escrow as a trust guarantee.
    function stake() external payable {
        require(msg.value > 0, "Must stake >0");
        stakedAmount[msg.sender] += msg.value;
        isLocked[msg.sender] = true;
        emit StakeLocked(msg.sender, msg.value);
    }

    /// @notice Release full escrow back to user.
    function releaseStake(address user) external onlyOwner {
        uint256 amount = stakedAmount[user];
        require(amount > 0, "Nothing to release");
        stakedAmount[user] = 0;
        isLocked[user] = false;
        payable(user).transfer(amount);
        emit StakeReleased(user, amount);
    }

    /// @notice Slash a portion of the escrow on misbehavior.
    function slashStake(address user, uint256 amount) external onlyOwner {
        uint256 balance = stakedAmount[user];
        require(balance >= amount, "Insufficient stake");
        stakedAmount[user] = balance - amount;
        // funds stay in contract
        emit StakeSlashed(user, amount);
    }
}
