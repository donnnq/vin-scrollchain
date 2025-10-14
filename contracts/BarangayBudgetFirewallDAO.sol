// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayBudgetFirewallDAO {
    address public admin;

    struct BudgetRule {
        string barangay;
        string fundType;
        string firewallProtocol;
        string emotionalTag;
        bool enforced;
    }

    BudgetRule[] public rules;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitRule(string memory _barangay, string memory _fundType, string memory _firewallProtocol, string memory _emotionalTag) external onlyAdmin {
        rules.push(BudgetRule(_barangay, _fundType, _firewallProtocol, _emotionalTag, false));
    }

    function enforceRule(uint256 index) external onlyAdmin {
        rules[index].enforced = true;
    }

    function getRule(uint256 index) external view returns (BudgetRule memory) {
        return rules[index];
    }
}
