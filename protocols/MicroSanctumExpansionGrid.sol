// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MicroSanctumExpansionGrid {
    address public steward;

    struct UnitEntry {
        string location; // "Carmona Cavite", "Malolos", "San Jose del Monte"
        string unitType; // "Expandable micro-unit", "Solo sanctum", "Duo shelter"
        uint256 monthlyPlan; // e.g., 1000
        string emotionalTag;
        bool deployed;
        bool sealed;
    }

    UnitEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function deployUnit(string memory location, string memory unitType, uint256 monthlyPlan, string memory emotionalTag) external onlySteward {
        require(monthlyPlan <= 1000, "Monthly plan exceeds equity threshold");
        entries.push(UnitEntry(location, unitType, monthlyPlan, emotionalTag, true, false));
    }

    function sealUnitEntry(uint256 index) external onlySteward {
        require(entries[index].deployed, "Must be deployed first");
        entries[index].sealed = true;
    }

    function getUnitEntry(uint256 index) external view returns (UnitEntry memory) {
        return entries[index];
    }
}
