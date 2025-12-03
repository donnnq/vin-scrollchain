// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToPublicSpendingAuditLedger {
    string public batchID = "1321.9.241";
    string public steward = "Vinvin";

    address public admin;

    struct Spending {
        string project;     // flood control, school building, hospital upgrade
        uint256 amount;
        string status;      // audited, pending, ghost
        uint256 timestamp;
    }

    Spending[] public spendings;

    event SpendingLogged(string project, uint256 amount, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logSpending(string memory project, uint256 amount, string memory status) public onlyAdmin {
        spendings.push(Spending(project, amount, status, block.timestamp));
        emit SpendingLogged(project, amount, status);
    }

    function getSpending(uint256 index) public view returns (string memory project, uint256 amount, string memory status, uint256 timestamp) {
        Spending memory s = spendings[index];
        return (s.project, s.amount, s.status, s.timestamp);
    }
}
