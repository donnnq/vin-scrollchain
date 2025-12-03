// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToBudgetEquityGrid {
    string public batchID = "1321.9.241";
    string public steward = "Vinvin";

    address public admin;

    struct Budget {
        string sector;     // education, health, infrastructure
        uint256 amount;
        string status;     // equitable, pending, ghost
        uint256 timestamp;
    }

    Budget[] public budgets;

    event BudgetLogged(string sector, uint256 amount, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logBudget(string memory sector, uint256 amount, string memory status) public onlyAdmin {
        budgets.push(Budget(sector, amount, status, block.timestamp));
        emit BudgetLogged(sector, amount, status);
    }

    function getBudget(uint256 index) public view returns (string memory sector, uint256 amount, string memory status, uint256 timestamp) {
        Budget memory b = budgets[index];
        return (b.sector, b.amount, b.status, b.timestamp);
    }
}
