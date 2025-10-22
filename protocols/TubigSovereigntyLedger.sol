// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TubigSovereigntyLedger {
    address public admin;

    struct SovereigntyEntry {
        string barangayName; // "Brgy. Bangkal Northville 8"
        string waterSource; // "Poso", "Rainwater catchment", "PrimeWater"
        string sovereigntyLevel; // "Autonomous", "Dependent", "Hybrid"
        string emotionalTag;
        bool logged;
        bool sealed;
    }

    SovereigntyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logSovereignty(string memory barangayName, string memory waterSource, string memory sovereigntyLevel, string memory emotionalTag) external onlyAdmin {
        entries.push(SovereigntyEntry(barangayName, waterSource, sovereigntyLevel, emotionalTag, true, false));
    }

    function sealSovereigntyEntry(uint256 index) external onlyAdmin {
        require(entries[index].logged, "Must be logged first");
        entries[index].sealed = true;
    }

    function getSovereigntyEntry(uint256 index) external view returns (SovereigntyEntry memory) {
        return entries[index];
    }
}
