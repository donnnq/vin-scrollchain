// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WaterTestingImmunityLedger {
    address public admin;

    struct ImmunityEntry {
        string barangayName; // "Brgy. Bangkal Northville 8"
        string waterSource; // "Poso", "Rainwater", "Tank supply"
        string testStatus; // "Passed", "Pending", "Failed"
        string immunityAction; // "Filtration", "Boiling advisory", "DOH intervention"
        string emotionalTag;
        bool logged;
        bool sealed;
    }

    ImmunityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logWaterTest(string memory barangayName, string memory waterSource, string memory testStatus, string memory immunityAction, string memory emotionalTag) external onlyAdmin {
        entries.push(ImmunityEntry(barangayName, waterSource, testStatus, immunityAction, emotionalTag, true, false));
    }

    function sealImmunityEntry(uint256 index) external onlyAdmin {
        require(entries[index].logged, "Must be logged first");
        entries[index].sealed = true;
    }

    function getImmunityEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
