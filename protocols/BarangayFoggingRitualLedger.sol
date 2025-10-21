// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayFoggingRitualLedger {
    address public admin;

    struct FoggingEntry {
        string barangay;
        string purokZone;
        string ritualLayer; // "Larvicide Deployment", "Community Alert", "Youth Brigade"
        string emotionalTag;
        bool summoned;
        bool fogged;
        bool sealed;
    }

    FoggingEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonFogging(string memory barangay, string memory purokZone, string memory ritualLayer, string memory emotionalTag) external onlyAdmin {
        entries.push(FoggingEntry(barangay, purokZone, ritualLayer, emotionalTag, true, false, false));
    }

    function confirmFogging(uint256 index) external onlyAdmin {
        entries[index].fogged = true;
    }

    function sealFoggingEntry(uint256 index) external onlyAdmin {
        require(entries[index].fogged, "Must be fogged first");
        entries[index].sealed = true;
    }

    function getFoggingEntry(uint256 index) external view returns (FoggingEntry memory) {
        return entries[index];
    }
}
