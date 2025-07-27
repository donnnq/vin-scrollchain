// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

/// @title vinReputationStaking
/// @notice Let supporters stake on behalf of profiles and earn rewards.
contract vinReputationStaking is Ownable {
    // profile => backer => staked amount
    mapping(address => mapping(address => uint256)) public backing;
    mapping(address => uint256) public totalBacked;
    mapping(address => mapping(address => bool)) public rewardClaimed;

    event Backed(address indexed backer, address indexed profile, uint256 amount);
    event RewardClaimed(address indexed backer, address indexed profile, uint256 amount);
    event BackingWithdrawn(address indexed backer, address indexed profile, uint256 amount);

    /// @notice Stake collateral in support of a profile.
    function backProfile(address profile) external payable {
        require(msg.value > 0, "Must stake >0");
        backing[profile][msg.sender] += msg.value;
        totalBacked[profile] += msg.value;
        emit Backed(msg.sender, profile, msg.value);
    }

    /// @notice Claim reward after profile maintains or increases trustRate.
    function claimReward(address profile) external {
        require(backing[profile][msg.sender] > 0, "No backing");
        require(!rewardClaimed[profile][msg.sender], "Already claimed");
        // placeholder reward logic: 10% of stake
        uint256 reward = backing[profile][msg.sender] / 10;
        rewardClaimed[profile][msg.sender] = true;
        payable(msg.sender).transfer(reward);
        emit RewardClaimed(msg.sender, profile, reward);
    }

    /// @notice Withdraw backing stake (if no slashing happened).
    function withdrawBacking(address profile) external {
        uint256 amount = backing[profile][msg.sender];
        require(amount > 0, "Nothing to withdraw");
        backing[profile][msg.sender] = 0;
        totalBacked[profile] -= amount;
        payable(msg.sender).transfer(amount);
        emit BackingWithdrawn(msg.sender, profile, amount);
    }
}
