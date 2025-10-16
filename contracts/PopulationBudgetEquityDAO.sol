// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PopulationBudgetEquityDAO {
    address public admin;

    struct AllocationEntry {
        string districtLabel;
        uint256 populationCount;
        string budgetProposal;
        string emotionalTag;
        bool ratified;
    }

    AllocationEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory districtLabel, uint256 populationCount, string memory budgetProposal, string memory emotionalTag) external onlyAdmin {
        entries.push(AllocationEntry(districtLabel, populationCount, budgetProposal, emotionalTag, false));
    }

    function ratifyEntry(uint256 index) external onlyAdmin {
        entries[index].ratified = true;
    }

    function getEntry(uint256 index) external view returns (AllocationEntry memory) {
        return entries[index];
    }
}
