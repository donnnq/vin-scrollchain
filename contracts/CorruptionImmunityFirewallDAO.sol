// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CorruptionImmunityFirewallDAO {
    address public admin;

    struct FirewallRule {
        string department;
        string riskType;
        string immunityProtocol;
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

    function submitRule(string memory _department, string memory _riskType, string memory _immunityProtocol, string memory _emotionalTag) external onlyAdmin {
        rules.push(FirewallRule(_department, _riskType, _immunityProtocol, _emotionalTag, false));
    }

    function enforceRule(uint256 index) external onlyAdmin {
        rules[index].enforced = true;
    }

    function getRule(uint256 index) external view returns (FirewallRule memory) {
        return rules[index];
    }
}
