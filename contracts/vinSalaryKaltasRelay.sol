// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract vinSalaryKaltasRelay {
    struct Deduction {
        string reason;
        uint256 amount;
        uint256 timestamp;
    }

    mapping(address => Deduction[]) public deductions;

    function deduct(address worker, string memory reason, uint256 amount) public {
        deductions[worker].push(Deduction(reason, amount, block.timestamp));
    }

    function getDeductions(address worker) public view returns (Deduction[] memory) {
        return deductions[worker];
    }
}
