// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ScrollPass {
    enum Tier { Freemium, Basic, Mid, High, Crazy }

    struct Member {
        Tier tier;
        uint256 streak;
        uint256 lastLogin;
    }

    mapping(address => Member) public members;
    event TierUpgraded(address indexed user, Tier newTier);
    event StreakUpdated(address indexed user, uint256 newStreak);

    function upgradeTier(Tier newTier) external payable {
        // Pricing logic handled off-chain or via token contract
        members[msg.sender].tier = newTier;
        emit TierUpgraded(msg.sender, newTier);
    }

    function login() external {
        Member storage m = members[msg.sender];
        if (block.timestamp >= m.lastLogin + 1 days) {
            m.streak += 1;
            m.lastLogin = block.timestamp;
            emit StreakUpdated(msg.sender, m.streak);
        }
    }

    function getMyPass() external view returns (Tier, uint256, uint256) {
        Member memory m = members[msg.sender];
        return (m.tier, m.streak, m.lastLogin);
    }
}
