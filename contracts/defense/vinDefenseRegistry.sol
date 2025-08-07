// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinDefenseRegistry {
    struct DefenseScroll {
        string name;
        string category;
        address deployer;
        uint256 timestamp;
    }

    DefenseScroll[] public registry;

    event DefenseScrollRegistered(string name, string category, address indexed deployer, uint256 timestamp);

    function registerScroll(string memory name, string memory category) external {
        registry.push(DefenseScroll(name, category, msg.sender, block.timestamp));
        emit DefenseScrollRegistered(name, category, msg.sender, block.timestamp);
    }

    function getScroll(uint256 index) external view returns (DefenseScroll memory) {
        return registry[index];
    }

    function totalScrolls() external view returns (uint256) {
        return registry.length;
    }
}
