// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HighEarnerCivicTax {
    address public steward;
    uint256 public taxRate = 5; // 5% civic restoration tax
    uint256 public threshold = 100000 * 1e18; // $100K in wei (assuming stablecoin peg)

    mapping(address => uint256) public earnings;
    mapping(address => uint256) public civicTaxPaid;

    event TaxBlessed(address indexed earner, uint256 amount, string scrollNote);

    constructor() {
        steward = msg.sender;
    }

    function recordEarnings(address earner, uint256 amount) external {
        require(msg.sender == steward, "Only steward can record");
        earnings[earner] += amount;

        if (earnings[earner] >= threshold) {
            uint256 tax = (amount * taxRate) / 100;
            civicTaxPaid[earner] += tax;

            emit TaxBlessed(earner, tax, "Scrollbound contribution blessed");
        }
    }

    function getTaxBlessing(address earner) external view returns (uint256) {
        return civicTaxPaid[earner];
    }
}
