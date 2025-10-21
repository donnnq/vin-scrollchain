// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RainSurgeDrainageProtocol {
    address public admin;

    struct DrainageEntry {
        string barangay;
        string purokZone;
        string surgeFactor; // "Monsoon Overflow", "Canal Blockage", "Urban Runoff"
        string interventionLayer; // "Cleanup", "Larvicide Deployment", "Community Alert"
        string emotionalTag;
        bool summoned;
        bool cleared;
        bool sealed;
    }

    DrainageEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonDrainage(string memory barangay, string memory purokZone, string memory surgeFactor, string memory interventionLayer, string memory emotionalTag) external onlyAdmin {
        entries.push(DrainageEntry(barangay, purokZone, surgeFactor, interventionLayer, emotionalTag, true, false, false));
    }

    function confirmClearing(uint256 index) external onlyAdmin {
        entries[index].cleared = true;
    }

    function sealDrainageEntry(uint256 index) external onlyAdmin {
        require(entries[index].cleared, "Must be cleared first");
        entries[index].sealed = true;
    }

    function getDrainageEntry(uint256 index) external view returns (DrainageEntry memory) {
        return entries[index];
    }
}
