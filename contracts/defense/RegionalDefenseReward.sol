// SPDX-License-Identifier: Mythic-Defense
pragma solidity ^0.8.20;

contract RegionalDefenseReward {
    address public steward;
    uint256 public totalRewardPool = 5_000_000_000; // $5B
    mapping(address => bool) public activatedAllies;
    mapping(address => uint256) public rewardClaimed;

    event AllyActivated(address indexed ally, uint256 reward);
    event RewardUpdated(address indexed ally, uint256 newAmount);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function activateAlly(address ally, uint256 rewardAmount) external onlySteward {
        require(!activatedAllies[ally], "Already activated");
        require(rewardAmount <= totalRewardPool, "Insufficient pool");
        activatedAllies[ally] = true;
        rewardClaimed[ally] = rewardAmount;
        totalRewardPool -= rewardAmount;
        emit AllyActivated(ally, rewardAmount);
    }

    function updateReward(address ally, uint256 newAmount) external onlySteward {
        require(activatedAllies[ally], "Ally not activated");
        require(newAmount <= totalRewardPool + rewardClaimed[ally], "Exceeds pool");
        totalRewardPool += rewardClaimed[ally] - newAmount;
        rewardClaimed[ally] = newAmount;
        emit RewardUpdated(ally, newAmount);
    }

    function getReward(address ally) external view returns (uint256) {
        return rewardClaimed[ally];
    }

    function isActivated(address ally) external view returns (bool) {
        return activatedAllies[ally];
    }
}
