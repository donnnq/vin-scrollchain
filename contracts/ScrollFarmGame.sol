// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ScrollFarmGame {
    struct Player {
        uint256 level;
        uint256 xp;
        uint256 claimedTokens;
        bool dailyClaimed;
    }

    mapping(address => Player) public players;
    uint256 public totalSupply;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function claimTokens(uint256 rewardTier) external {
        Player storage p = players[msg.sender];
        require(rewardTier == 10 || rewardTier == 20 || rewardTier == 30, "Invalid tier");
        require(!p.dailyClaimed, "Already claimed today");

        p.claimedTokens += rewardTier;
        p.dailyClaimed = true;
        totalSupply += rewardTier;
    }

    function gainXP(uint256 xpEarned) external {
        Player storage p = players[msg.sender];
        p.xp += xpEarned;

        if (p.xp >= p.level * 100) {
            p.level += 1;
            p.xp = 0;
        }
    }

    function resetDailyClaim() external {
        require(msg.sender == owner, "Unauthorized");
        players[msg.sender].dailyClaimed = false;
    }
}
