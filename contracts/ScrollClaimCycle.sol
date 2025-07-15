// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ScrollClaimCycle {
    struct UserClaim {
        uint256 lastClaim;
        uint256 totalClaimed;
    }

    mapping(address => UserClaim) public claims;
    uint256 public claimAmount = 10;
    uint256 public claimCooldown = 30 minutes;

    event Claimed(address indexed user, uint256 amount);

    function claimReward() external {
        UserClaim storage uc = claims[msg.sender];
        require(block.timestamp >= uc.lastClaim + claimCooldown, "Cooldown active");

        uc.lastClaim = block.timestamp;
        uc.totalClaimed += claimAmount;

        emit Claimed(msg.sender, claimAmount);
    }

    function getClaimStatus(address user) external view returns (bool canClaim, uint256 nextClaimTime) {
        UserClaim memory uc = claims
