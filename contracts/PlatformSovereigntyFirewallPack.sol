// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlatformSovereigntyFirewallPack {
    address public admin;

    struct FirewallRule {
        string platformLabel;
        string ruleDescription;
        string emotionalTag;
        bool enforced;
    }

    FirewallRule[] public rules;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitRule(string memory platformLabel, string memory ruleDescription, string memory emotionalTag) external onlyAdmin {
        rules.push(FirewallRule(platformLabel, ruleDescription, emotionalTag, false));
    }

    function enforceRule(uint256 index) external onlyAdmin {
        rules[index].enforced = true;
    }

    function getRule(uint256 index) external view returns (FirewallRule memory) {
        return rules[index];
    }
}
