// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CivicEmergencyCodex {
    address public admin;

    struct EmergencyEntry {
        string zone;
        string amenityType; // "Portalet", "Trash Can", "First Aid Booth", etc.
        string codexClause;
        string emotionalTag;
        bool summoned;
        bool activated;
        bool sealed;
    }

    EmergencyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonEmergencyAmenity(string memory zone, string memory amenityType, string memory codexClause, string memory emotionalTag) external onlyAdmin {
        entries.push(EmergencyEntry(zone, amenityType, codexClause, emotionalTag, true, false, false));
    }

    function confirmActivation(uint256 index) external onlyAdmin {
        entries[index].activated = true;
    }

    function sealEmergencyEntry(uint256 index) external onlyAdmin {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getEmergencyEntry(uint256 index) external view returns (EmergencyEntry memory) {
        return entries[index];
    }
}
