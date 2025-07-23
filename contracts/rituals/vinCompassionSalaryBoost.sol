// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinCompassionSalaryBoost {
    address public scrollkeeper;

    struct SalaryBoost {
        address beneficiary;
        uint256 baseSalary;
        uint256 bonusAmount;
        uint256 timestamp;
    }

    SalaryBoost[] public boosts;

    event SalaryGranted(address beneficiary, uint256 bonusAmount);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Not authorized");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    function grantSalaryBoost(address beneficiary, uint256 baseSalary, uint256 bonusAmount) external onlyScrollkeeper {
        boosts.push(SalaryBoost(beneficiary, baseSalary, bonusAmount, block.timestamp));
        payable(beneficiary).transfer(baseSalary + bonusAmount);
        emit SalaryGranted(beneficiary, bonusAmount);
    }

    function totalBoosts() external view returns (uint256) {
        return boosts.length;
    }

    receive() external payable {}
}
