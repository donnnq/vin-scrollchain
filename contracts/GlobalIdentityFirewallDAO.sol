// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalIdentityFirewallDAO {
    address public admin;

    struct IdentityRule {
        string platform;
        string riskTag;
        string protectionProtocol;
        bool enforced;
    }

    IdentityRule[] public rules;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitRule(string memory _platform, string memory _riskTag, string memory _protectionProtocol) external onlyAdmin {
        rules.push(IdentityRule(_platform, _riskTag, _protectionProtocol, false));
    }

    function enforceRule(uint256 index) external onlyAdmin {
        rules[index].enforced = true;
    }

    function getRule(uint256 index) external view returns (IdentityRule memory) {
        return rules[index];
    }
}
