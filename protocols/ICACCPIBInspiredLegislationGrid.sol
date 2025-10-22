// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ICACCPIBInspiredLegislationGrid {
    address public admin;

    struct LegislationEntry {
        string billTitle; // "Infrastructure Anomalies Investigation Act of 2025"
        string inspirationSource; // "ICAC (Hong Kong)", "CPIB (Singapore)"
        string legislativeSignal; // "Independent mandate", "Legal power", "Public trust restoration"
        string emotionalTag;
        bool drafted;
        bool sealed;
    }

    LegislationEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function draftLegislation(string memory billTitle, string memory inspirationSource, string memory legislativeSignal, string memory emotionalTag) external onlyAdmin {
        entries.push(LegislationEntry(billTitle, inspirationSource, legislativeSignal, emotionalTag, true, false));
    }

    function sealLegislationEntry(uint256 index) external onlyAdmin {
        require(entries[index].drafted, "Must be drafted first");
        entries[index].sealed = true;
    }

    function getLegislationEntry(uint256 index) external view returns (LegislationEntry memory) {
        return entries[index];
    }
}
