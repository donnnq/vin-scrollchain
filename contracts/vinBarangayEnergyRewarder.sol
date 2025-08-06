// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title vinBarangayEnergyRewarder
/// @dev Rewards top-performing barangays based on energy-saving metrics

contract vinBarangayEnergyRewarder {
    address public admin;
    uint256 public rewardPool;
    mapping(string => uint256) public barangayScores;
    mapping(string => uint256) public barangayRewards;

    event BarangayScored(string indexed name, uint256 score);
    event RewardDistributed(string indexed name, uint256 amount);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    constructor() {
        admin = msg.sender;
        rewardPool = 1000000 ether; // symbolic reward pool, can be adjusted
    }

    function submitScore(string memory barangayName, uint256 score) public onlyAdmin {
        require(score <= 100, "Max score is 100");
        barangayScores[barangayName] = score;
        emit BarangayScored(barangayName, score);
    }

    function distributeReward(string memory barangayName) public onlyAdmin {
        uint256 score = barangayScores[barangayName];
        require(score > 0, "No score available");

        uint256 rewardAmount = (score * rewardPool) / 10000;
        barangayRewards[barangayName] += rewardAmount;
        rewardPool -= rewardAmount;

        emit RewardDistributed(barangayName, rewardAmount);
    }

    function getReward(string memory barangayName) public view returns (uint256) {
        return barangayRewards[barangayName];
    }

    function refillPool(uint256 amount) public onlyAdmin {
        rewardPool += amount;
    }
}
