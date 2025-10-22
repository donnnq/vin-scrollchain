// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UrbanWaterResilienceGrid {
    address public admin;

    struct ResilienceEntry {
        string cityOrBarangay; // "Malolos City"
        string backupSystem; // "Poso", "Rainwater", "Water tankers"
        string resilienceScore; // "High", "Moderate", "Low"
        string emotionalTag;
        bool deployed;
        bool sealed;
    }

    ResilienceEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function deployResilience(string memory cityOrBarangay, string memory backupSystem, string memory resilienceScore, string memory emotionalTag) external onlyAdmin {
        entries.push(ResilienceEntry(cityOrBarangay, backupSystem, resilienceScore, emotionalTag, true, false));
    }

    function sealResilienceEntry(uint256 index) external onlyAdmin {
        require(entries[index].deployed, "Must be deployed first");
        entries[index].sealed = true;
    }

    function getResilienceEntry(uint256 index) external view returns (ResilienceEntry memory) {
        return entries[index];
    }
}
