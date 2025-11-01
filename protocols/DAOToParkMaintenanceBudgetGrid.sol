// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DAOToParkMaintenanceBudgetGrid {
    address public steward;

    struct BudgetEntry {
        string parkName; // "Monumento Park, Intramuros Heritage Garden"
        string clause; // "Scrollchain-sealed grid for park maintenance budgeting and urban dignity consequence"
        string emotionalTag;
        bool allocated;
        bool sustained;
    }

    BudgetEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function allocateBudget(string memory parkName, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(BudgetEntry(parkName, clause, emotionalTag, true, true));
    }

    function getBudgetEntry(uint256 index) external view returns (BudgetEntry memory) {
        return entries[index];
    }
}
