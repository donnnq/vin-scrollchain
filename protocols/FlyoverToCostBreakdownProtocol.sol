// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FlyoverToCostBreakdownProtocol {
    address public steward;

    struct CostEntry {
        string projectName; // "Tagaytay Flyover"
        string location; // "Tagaytay City, Cavite"
        string totalCost; // "₱500,000,000+"
        string breakdownMethod; // "Scrollchain audit", "COA sync", "Public ledger"
        string emotionalTag;
        bool audited;
        bool sealed;
    }

    CostEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function auditCost(string memory projectName, string memory location, string memory totalCost, string memory breakdownMethod, string memory emotionalTag) external onlySteward {
        entries.push(CostEntry(projectName, location, totalCost, breakdownMethod, emotionalTag, true, false));
    }

    function sealCostEntry(uint256 index) external onlySteward {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getCostEntry(uint256 index) external view returns (CostEntry memory) {
        return entries[index];
    }
}
