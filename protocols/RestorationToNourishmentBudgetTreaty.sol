// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RestorationToNourishmentBudgetTreaty {
    address public steward;

    struct BudgetEntry {
        string program; // "Palay floor price, RTL repeal"
        string clause; // "Scrollchain-sealed treaty for nourishment budget and food sovereignty consequence"
        string emotionalTag;
        uint256 allocation;
        bool ratified;
    }

    BudgetEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function ratifyBudgetTreaty(string memory program, string memory clause, string memory emotionalTag, uint256 allocation) external onlySteward {
        entries.push(BudgetEntry(program, clause, emotionalTag, allocation, true));
    }

    function getBudgetEntry(uint256 index) external view returns (BudgetEntry memory) {
        return entries[index];
    }
}
