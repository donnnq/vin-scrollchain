// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ScrollCelebrationVault {
    struct Drop {
        string eventName;
        string badge;
        uint256 timestamp;
    }

    Drop[] public drops;
    mapping(address => uint256[]) public userDrops;

    event DropClaimed(address indexed user, string eventName, string badge);

    /// @notice Claim a commemorative badge for a named event
    function claimDrop(string calldata eventName, string calldata badge) external {
        drops.push(Drop(eventName, badge, block.timestamp));
        userDrops[msg.sender].push(drops.length - 1);
        emit DropClaimed(msg.sender, eventName, badge);
    }

    /// @notice Get indices of drops you have claimed
    function getMyDrops(address user) external view returns (uint256[] memory) {
        return userDrops[user];
    }

    /// @notice Fetch all drops in the vault
    function getAllDrops() external view returns (Drop[] memory) {
        return drops;
    }
}
