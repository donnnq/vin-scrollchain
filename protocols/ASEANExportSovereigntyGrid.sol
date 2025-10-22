// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ASEANExportSovereigntyGrid {
    address public admin;

    struct SovereigntyEntry {
        string memberCountry; // "Philippines", "Vietnam", "Malaysia"
        string exportSector; // "Electronics", "Agriculture", "Textiles"
        string resilienceLevel; // "High", "Moderate", "Vulnerable"
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

    function logSovereignty(string memory memberCountry, string memory exportSector, string memory resilienceLevel, string memory emotionalTag) external onlyAdmin {
        entries.push(SovereigntyEntry(memberCountry, exportSector, resilienceLevel, emotionalTag, true, false));
    }

    function sealSovereigntyEntry(uint256 index) external onlyAdmin {
        require(entries[index].logged, "Must be logged first");
        entries[index].sealed = true;
    }

    function getSovereigntyEntry(uint256 index) external view returns (SovereigntyEntry memory) {
        return entries[index];
    }
}
