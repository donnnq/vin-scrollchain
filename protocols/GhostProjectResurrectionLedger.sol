// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GhostProjectResurrectionLedger {
    address public admin;

    struct ResurrectionEntry {
        string projectName; // "Barangay Road Rehab", "Flood Control Phase 2"
        string resurrectionSignal; // "No physical trace", "COA flagged", "Budget released but unverified"
        string emotionalTag;
        bool resurrected;
        bool sealed;
    }

    ResurrectionEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function resurrectProject(string memory projectName, string memory resurrectionSignal, string memory emotionalTag) external onlyAdmin {
        entries.push(ResurrectionEntry(projectName, resurrectionSignal, emotionalTag, true, false));
    }

    function sealResurrectionEntry(uint256 index) external onlyAdmin {
        require(entries[index].resurrected, "Must be resurrected first");
        entries[index].sealed = true;
    }

    function getResurrectionEntry(uint256 index) external view returns (ResurrectionEntry memory) {
        return entries[index];
    }
}
