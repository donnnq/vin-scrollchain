// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayHydrationAccessGrid {
    address public admin;

    struct AccessEntry {
        string purokName; // "Purok 3"
        string waterSourceType; // "Poso", "Rainwater", "PrimeWater"
        string accessStatus; // "Open", "Restricted", "Emergency-only"
        string emotionalTag;
        bool mapped;
        bool sealed;
    }

    AccessEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function mapHydrationAccess(string memory purokName, string memory waterSourceType, string memory accessStatus, string memory emotionalTag) external onlyAdmin {
        entries.push(AccessEntry(purokName, waterSourceType, accessStatus, emotionalTag, true, false));
    }

    function sealAccessEntry(uint256 index) external onlyAdmin {
        require(entries[index].mapped, "Must be mapped first");
        entries[index].sealed = true;
    }

    function getAccessEntry(uint256 index) external view returns (AccessEntry memory) {
        return entries[index];
    }
}
