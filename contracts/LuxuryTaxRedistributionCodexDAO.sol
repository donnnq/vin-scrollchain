// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LuxuryTaxRedistributionCodexDAO {
    address public admin;

    struct RedistributionRule {
        string luxuryItem;
        string taxRate;
        string redistributionTarget;
        string emotionalTag;
        bool enforced;
    }

    RedistributionRule[] public rules;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitRule(string memory _luxuryItem, string memory _taxRate, string memory _redistributionTarget, string memory _emotionalTag) external onlyAdmin {
        rules.push(RedistributionRule(_luxuryItem, _taxRate, _redistributionTarget, _emotionalTag, false));
    }

    function enforceRule(uint256 index) external onlyAdmin {
        rules[index].enforced = true;
    }

    function getRule(uint256 index) external view returns (RedistributionRule memory) {
        return rules[index];
    }
}
