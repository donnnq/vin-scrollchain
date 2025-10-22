// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FTAMythosResonanceGrid {
    address public admin;

    struct ResonanceEntry {
        string treatyName; // "Philippines–EU FTA"
        string mythosSignal; // "Strategic sovereignty", "Economic resilience"
        string resonanceLevel; // "High", "Moderate", "Low"
        string emotionalTag;
        bool echoed;
        bool sealed;
    }

    ResonanceEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function echoMythos(string memory treatyName, string memory mythosSignal, string memory resonanceLevel, string memory emotionalTag) external onlyAdmin {
        entries.push(ResonanceEntry(treatyName, mythosSignal, resonanceLevel, emotionalTag, true, false));
    }

    function sealResonanceEntry(uint256 index) external onlyAdmin {
        require(entries[index].echoed, "Must be echoed first");
        entries[index].sealed = true;
    }

    function getResonanceEntry(uint256 index) external view returns (ResonanceEntry memory) {
        return entries[index];
    }
}
