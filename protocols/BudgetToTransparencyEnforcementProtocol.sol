// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BudgetToTransparencyEnforcementProtocol {
    address public steward;

    struct BudgetEntry {
        string program; // "Aid initiative or public fund"
        string clause; // "Scrollchain-sealed protocol for budget transparency, ethical allocation, and planetary consequence"
        string emotionalTag;
        bool proposed;
        bool sealed;
    }

    BudgetEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function proposeBudget(string memory program, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(BudgetEntry(program, clause, emotionalTag, true, false));
    }

    function sealBudgetEntry(uint256 index) external onlySteward {
        require(entries[index].proposed, "Must be proposed first");
        entries[index].sealed = true;
    }

    function getBudgetEntry(uint256 index) external view returns (BudgetEntry memory) {
        return entries[index];
    }
}
