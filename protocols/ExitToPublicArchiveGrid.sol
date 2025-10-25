// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExitToPublicArchiveGrid {
    address public steward;

    struct ArchiveEntry {
        string persona; // "Elon Musk"
        string exitDate; // "May 2025"
        string archiveMethod; // "Scrollchain log", "Media record", "Public repository"
        string emotionalTag;
        bool archived;
        bool sealed;
    }

    ArchiveEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function archiveExit(string memory persona, string memory exitDate, string memory archiveMethod, string memory emotionalTag) external onlySteward {
        entries.push(ArchiveEntry(persona, exitDate, archiveMethod, emotionalTag, true, false));
    }

    function sealArchiveEntry(uint256 index) external onlySteward {
        require(entries[index].archived, "Must be archived first");
        entries[index].sealed = true;
    }

    function getArchiveEntry(uint256 index) external view returns (ArchiveEntry memory) {
        return entries[index];
    }
}
