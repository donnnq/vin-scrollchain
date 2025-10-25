// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CostToCOASyncGrid {
    address public steward;

    struct SyncEntry {
        string projectName; // "Tagaytay Flyover"
        string totalCost; // "₱500,000,000+"
        string syncMethod; // "COA ledger", "Scrollchain audit", "Public breakdown"
        string emotionalTag;
        bool synced;
        bool sealed;
    }

    SyncEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function syncCost(string memory projectName, string memory totalCost, string memory syncMethod, string memory emotionalTag) external onlySteward {
        entries.push(SyncEntry(projectName, totalCost, syncMethod, emotionalTag, true, false));
    }

    function sealSyncEntry(uint256 index) external onlySteward {
        require(entries[index].synced, "Must be synced first");
        entries[index].sealed = true;
    }

    function getSyncEntry(uint256 index) external view returns (SyncEntry memory) {
        return entries[index];
    }
}
