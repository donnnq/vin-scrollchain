// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TreeMaintenanceKarmaLedger {
    address public steward;

    struct MaintenanceEntry {
        string treeLocation;
        string maintenanceStatus;
        string karmaSignal;
        string emotionalTag;
    }

    MaintenanceEntry[] public ledger;

    event TreeMaintenanceTagged(string treeLocation, string maintenanceStatus, string karmaSignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagMaintenance(
        string memory treeLocation,
        string memory maintenanceStatus,
        string memory karmaSignal,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(MaintenanceEntry(treeLocation, maintenanceStatus, karmaSignal, emotionalTag));
        emit TreeMaintenanceTagged(treeLocation, maintenanceStatus, karmaSignal, emotionalTag);
    }
}
