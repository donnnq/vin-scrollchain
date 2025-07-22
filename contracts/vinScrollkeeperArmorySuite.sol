// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/// @title vinScrollkeeperArmorySuite
/// @notice Vault for advanced tactical modules, gear upgrades, and onchain inventory for high-trust guardians
contract vinScrollkeeperArmorySuite {
    address public scrollkeeper;
    mapping(address => uint256) public gearLevel;
    mapping(address => bool) public eliteAgents;

    event GearUpgraded(address indexed agent, uint256 newLevel);
    event AgentActivated(address indexed agent);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Scroll access denied");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    function activateAgent(address agent) external onlyScrollkeeper {
        eliteAgents[agent] = true;
        gearLevel[agent] = 1;
        emit AgentActivated(agent);
    }

    function upgradeGear(address agent, uint256 level) external onlyScrollkeeper {
        require(eliteAgents[agent], "Not an authorized guardian");
        gearLevel[agent] = level;
        emit GearUpgraded(agent, level);
    }

    function getGearLevel(address agent) external view returns (uint256) {
        return gearLevel[agent];
    }
}
