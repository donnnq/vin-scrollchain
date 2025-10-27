// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TariffPlanToEconomicFeasibilityGrid {
    address public steward;

    struct FeasibilityEntry {
        string plan; // "Replace income tax with tariffs"
        string auditClause; // "Scrollchain-sealed grid for revenue viability, trade consequence, and fiscal resonance"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    FeasibilityEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexPlan(string memory plan, string memory auditClause, string memory emotionalTag) external onlySteward {
        entries.push(FeasibilityEntry(plan, auditClause, emotionalTag, true, false));
    }

    function sealFeasibilityEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getFeasibilityEntry(uint256 index) external view returns (FeasibilityEntry memory) {
        return entries[index];
    }
}
