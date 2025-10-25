// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PortfolioToNAVPUSyncGrid {
    address public steward;

    struct SyncEntry {
        string fundName; // "UnionBank PHP Equity Fund"
        string investorID; // "Vinvin"
        string NAVPU; // "PHP 507.57"
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

    function syncNAVPU(string memory fundName, string memory investorID, string memory NAVPU, string memory emotionalTag) external onlySteward {
        entries.push(SyncEntry(fundName, investorID, NAVPU, emotionalTag, true, false));
    }

    function sealSyncEntry(uint256 index) external onlySteward {
        require(entries[index].synced, "Must be synced first");
        entries[index].sealed = true;
    }

    function getSyncEntry(uint256 index) external view returns (SyncEntry memory) {
        return entries[index];
    }
}
