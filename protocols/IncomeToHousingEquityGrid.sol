// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract IncomeToHousingEquityGrid {
    address public steward;

    struct EquityEntry {
        string householdType; // "Solo", "Duo", "Family of 3"
        uint256 monthlyIncome;
        uint256 proposedMonthlyHulog;
        bool includesLivelihoodSupport;
        string emotionalTag;
        bool approved;
        bool sealed;
    }

    EquityEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function proposeEquityPlan(string memory householdType, uint256 monthlyIncome, uint256 proposedMonthlyHulog, bool includesLivelihoodSupport, string memory emotionalTag) external onlySteward {
        require(monthlyIncome >= 6000, "Minimum income threshold not met");
        require(proposedMonthlyHulog <= monthlyIncome / 6, "Plan exceeds affordability ratio");
        entries.push(EquityEntry(householdType, monthlyIncome, proposedMonthlyHulog, includesLivelihoodSupport, emotionalTag, true, false));
    }

    function sealEquityEntry(uint256 index) external onlySteward {
        require(entries[index].approved, "Must be approved first");
        entries[index].sealed = true;
    }

    function getEquityEntry(uint256 index) external view returns (EquityEntry memory) {
        return entries[index];
    }
}
