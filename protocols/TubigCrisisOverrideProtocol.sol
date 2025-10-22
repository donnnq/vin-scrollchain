// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TubigCrisisOverrideProtocol {
    address public admin;

    struct OverrideEntry {
        string barangayName; // "Brgy. Bangkal Northville 8"
        string crisisType; // "PrimeWater outage", "Flood contamination", "Drought"
        string overrideAction; // "Activate poso grid", "Deploy tankers", "Rainwater harvesting"
        string emotionalTag;
        bool triggered;
        bool sealed;
    }

    OverrideEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function triggerOverride(string memory barangayName, string memory crisisType, string memory overrideAction, string memory emotionalTag) external onlyAdmin {
        entries.push(OverrideEntry(barangayName, crisisType, overrideAction, emotionalTag, true, false));
    }

    function sealOverrideEntry(uint256 index) external onlyAdmin {
        require(entries[index].triggered, "Must be triggered first");
        entries[index].sealed = true;
    }

    function getOverrideEntry(uint256 index) external view returns (OverrideEntry memory) {
        return entries[index];
    }
}
