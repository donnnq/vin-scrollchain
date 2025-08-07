// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinEarlyBirdRewarder {
    struct Submission {
        bool submitted;
        bool verified;
        uint256 timestamp;
        bool rewarded;
    }

    mapping(address => mapping(uint256 => Submission)) public submissions;
    mapping(address => uint256) public totalRewards;
    uint256 public rewardAmount = 20000;
    address public scrollkeeper;

    event WorkSubmitted(address indexed official, uint256 questId, uint256 timestamp);
    event RewardIssued(address indexed official, uint256 questId, uint256 amount);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Only Scrollkeeper may verify and reward");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    function submitWork(uint256 _questId) public {
        require(!submissions[msg.sender][_questId].submitted, "Already submitted");
        submissions[msg.sender][_questId] = Submission(true, false, block.timestamp, false);
        emit WorkSubmitted(msg.sender, _questId, block.timestamp);
    }

    function verifyAndReward(address _addr, uint256 _questId) public onlyScrollkeeper {
        Submission storage s = submissions[_addr][_questId];
        require(s.submitted, "No submission found");
        require(!s.rewarded, "Already rewarded");

        s.verified = true;
        s.rewarded = true;
        totalRewards[_addr] += rewardAmount;

        emit RewardIssued(_addr, _questId, rewardAmount);
    }

    function getTotalRewards(address _addr) public view returns (uint256) {
        return totalRewards[_addr];
    }
}
