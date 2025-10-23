// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FamilyIncomeGrowthTracker {
    address public steward;

    struct IncomeEntry {
        string householdID;
        uint256 baselineIncome;
        uint256 currentIncome;
        string livelihoodSource; // "Barangay hub", "Remote work", "Teen-led microbiz"
        string emotionalTag;
        bool tracked;
        bool sealed;
    }

    IncomeEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function trackIncome(string memory householdID, uint256 baselineIncome, uint256 currentIncome, string memory livelihoodSource, string memory emotionalTag) external onlySteward {
        entries.push(IncomeEntry(householdID, baselineIncome, currentIncome, livelihoodSource, emotionalTag, true, false));
    }

    function sealIncomeEntry(uint256 index) external onlySteward {
        require(entries[index].tracked, "Must be tracked first");
        entries[index].sealed = true;
    }

    function getIncomeEntry(uint256 index) external view returns (IncomeEntry memory) {
        return entries[index];
    }
}
