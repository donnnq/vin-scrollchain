// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ScrollSpinRoleta {
    struct SpinLog {
        uint256 timestamp;
        string dropItem;
        uint256 rarity; // 1 Common, 2 Rare, 3 Mythic
    }

    string[] public items = ["NFT Frame", "Dragon Egg", "Avatar Skin", "VINtoken Boost", "ScrollBadge"];
    mapping(address => SpinLog[]) public logs;

    event SpinExecuted(address indexed player, string dropItem, uint256 rarity);

    function spin() external {
        uint256 rand = uint256(keccak256(abi.encodePacked(block.timestamp, msg.sender))) % items.length;
        string memory drop = items[rand];
        uint256 rarity = (rand % 3) + 1;

        logs[msg.sender].push(SpinLog(block.timestamp, drop, rarity));
        emit SpinExecuted(msg.sender, drop, rarity);
    }

    function getMySpins() external view returns (SpinLog[] memory) {
        return logs[msg.sender];
    }
}
