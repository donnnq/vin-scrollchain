// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AIIndustrialFirewallDAO {
    address public admin;

    struct FirewallRule {
        string sector;
        string threatVector;
        string containmentStrategy;
        string emotionalTag;
        bool activated;
    }

    FirewallRule[] public rules;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitRule(string memory _sector, string memory _threatVector, string memory _containmentStrategy, string memory _emotionalTag) external onlyAdmin {
        rules.push(FirewallRule(_sector, _threatVector, _containmentStrategy, _emotionalTag, false));
    }

    function activateRule(uint256 index) external onlyAdmin {
        rules[index].activated = true;
    }

    function getRule(uint256 index) external view returns (FirewallRule memory) {
        return rules[index];
    }
}
