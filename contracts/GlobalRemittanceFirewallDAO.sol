// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalRemittanceFirewallDAO {
    address public admin;

    struct FirewallRule {
        string sourceCountry;
        string destinationRegion;
        string riskTag;
        string auditProtocol;
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

    function submitRule(string memory _sourceCountry, string memory _destinationRegion, string memory _riskTag, string memory _auditProtocol) external onlyAdmin {
        rules.push(FirewallRule(_sourceCountry, _destinationRegion, _riskTag, _auditProtocol, false));
    }

    function enforceRule(uint256 index) external onlyAdmin {
        rules[index].enforced = true;
    }

    function getRule(uint256 index) external view returns (FirewallRule memory) {
        return rules[index];
    }
}
