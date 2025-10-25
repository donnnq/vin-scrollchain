// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RollerToMaintenanceGrid {
    address public steward;

    struct MaintenanceEntry {
        string equipmentName; // "Bread transport bin"
        string issueType; // "Stuck rollers", "Bent axle", "Rust"
        string maintenanceMethod; // "Weekly check", "Grease application", "Wheel replacement"
        string emotionalTag;
        bool scheduled;
        bool sealed;
    }

    MaintenanceEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function scheduleMaintenance(string memory equipmentName, string memory issueType, string memory maintenanceMethod, string memory emotionalTag) external onlySteward {
        entries.push(MaintenanceEntry(equipmentName, issueType, maintenanceMethod, emotionalTag, true, false));
    }

    function sealMaintenanceEntry(uint256 index) external onlySteward {
        require(entries[index].scheduled, "Must be scheduled first");
        entries[index].sealed = true;
    }

    function getMaintenanceEntry(uint256 index) external view returns (MaintenanceEntry memory) {
        return entries[index];
    }
}
