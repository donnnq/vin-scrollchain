// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToBudgetClarityGrid {
    string public batchID = "1321.9.230";
    string public steward = "Vinvin";

    address public admin;

    struct Budget {
        string department;  // health, education, defense
        uint256 amount;     // allocated funds
        string status;      // transparent, pending, ghost
        uint256 timestamp;
    }

    Budget[] public budgets;

    event BudgetLogged(string department, uint256 amount, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logBudget(string memory department, uint256 amount, string memory status) public onlyAdmin {
        budgets.push(Budget(department, amount, status, block.timestamp));
        emit BudgetLogged(department, amount, status);
    }

    function getBudget(uint256 index) public view returns (string memory department, uint256 amount, string memory status, uint256 timestamp) {
        Budget memory b = budgets[index];
        return (b.department, b.amount, b.status, b.timestamp);
    }
}
