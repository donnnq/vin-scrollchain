// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/// @title vinVaultpowerBadgeAuthority
/// @notice Role-based power weights for speech rights, badge tiers, and influence scaling
contract vinVaultpowerBadgeAuthority {
    address public scrollkeeper;

    enum Badge { None, Ember, Quartz, Obsidian, Mythsteel, KiligCore }
    mapping(address => Badge) public badge;
    mapping(address => uint256) public speechPower;

    event BadgeAssigned(address indexed agent, Badge tier);
    event PowerCalculated(address indexed agent, uint256 power);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Scroll reject: Not keeper");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    function assignBadge(address agent, Badge tier) external onlyScrollkeeper {
        badge[agent] = tier;
        speechPower[agent] = computePower(tier);
        emit BadgeAssigned(agent, tier);
        emit PowerCalculated(agent, speechPower[agent]);
    }

    function computePower(Badge tier) internal pure returns (uint256) {
        if (tier == Badge.Ember) return 10;
        if (tier == Badge.Quartz) return 25;
        if (tier == Badge.Obsidian) return 50;
        if (tier == Badge.Mythsteel) return 80;
        if (tier == Badge.KiligCore) return 120;
        return 0;
    }

    function getVaultVoice(address agent) external view returns (string memory tier, uint256 power) {
        Badge b = badge[agent];
        power = speechPower[agent];

        if (b == Badge.Ember) tier = "Ember";
        else if (b == Badge.Quartz) tier = "Quartz";
        else if (b == Badge.Obsidian) tier = "Obsidian";
        else if (b == Badge.Mythsteel) tier = "Mythsteel";
        else if (b == Badge.KiligCore) tier = "KiligCore";
        else tier = "None";
    }
}
