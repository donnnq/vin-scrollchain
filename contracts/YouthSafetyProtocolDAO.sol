// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract YouthSafetyProtocolDAO {
    address public admin;

    struct SafetyRule {
        string platformLabel;
        string ruleDescription;
        string emotionalTag;
        bool enforced;
    }

    SafetyRule[] public rules;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitRule(string memory platformLabel, string memory ruleDescription, string memory emotionalTag) external onlyAdmin {
        rules.push(SafetyRule(platformLabel, ruleDescription, emotionalTag, false));
    }

    function enforceRule(uint256 index) external onlyAdmin {
        rules[index].enforced = true;
    }

    function getRule(uint256 index) external view returns (SafetyRule memory) {
        return rules[index];
    }
}
