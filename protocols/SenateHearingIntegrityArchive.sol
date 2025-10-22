// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SenateHearingIntegrityArchive {
    address public admin;

    struct ArchiveEntry {
        string hearingTitle; // "Infrastructure Anomalies Investigation Act of 2025"
        string integritySignal; // "Transparency ritual", "Public engagement", "Multi-agency oversight"
        string emotionalTag;
        bool archived;
        bool sealed;
    }

    ArchiveEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function archiveHearing(string memory hearingTitle, string memory integritySignal, string memory emotionalTag) external onlyAdmin {
        entries.push(ArchiveEntry(hearingTitle, integritySignal, emotionalTag, true, false));
    }

    function sealArchiveEntry(uint256 index) external onlyAdmin {
        require(entries[index].archived, "Must be archived first");
        entries[index].sealed = true;
    }

    function getArchiveEntry(uint256 index) external view returns (ArchiveEntry memory) {
        return entries[index];
    }
}
