// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CopilotImmunityFirewallDAO {
    address public admin;

    struct FirewallRule {
        string contextSource;
        string vulnerabilityType;
        string mitigationProtocol;
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

    function submitRule(string memory _contextSource, string memory _vulnerabilityType, string memory _mitigationProtocol, string memory _emotionalTag) external onlyAdmin {
        rules.push(FirewallRule(_contextSource, _vulnerabilityType, _mitigationProtocol, _emotionalTag, false));
    }

    function enforceRule(uint256 index) external onlyAdmin {
        rules[index].enforced = true;
    }

    function getRule(uint256 index) external view returns (FirewallRule memory) {
        return rules[index];
    }
}
