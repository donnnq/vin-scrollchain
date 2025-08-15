// SPDX-License-Identifier: Civic-Scrollsmith
pragma solidity ^0.8.0;

contract FairTaxContract {
    address public steward;
    uint256 public taxRate = 5; // 5% flat tax
    mapping(address => uint256) public contributions;
    event TaxPaid(address indexed contributor, uint256 amount, uint256 timestamp);

    constructor() {
        steward = msg.sender;
    }

    function payTax() external payable {
        require(msg.value > 0, "Blessing must be greater than zero");
        uint256 taxAmount = (msg.value * taxRate) / 100;
        contributions[msg.sender] += taxAmount;
        emit TaxPaid(msg.sender, taxAmount, block.timestamp);
    }

    function getContribution(address contributor) external view returns (uint256) {
        return contributions[contributor];
    }

    function updateSteward(address newSteward) external {
        require(msg.sender == steward, "Only steward can update");
        steward = newSteward;
    }
}
