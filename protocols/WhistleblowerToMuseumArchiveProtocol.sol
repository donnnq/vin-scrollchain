// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WhistleblowerToMuseumArchiveProtocol {
    address public steward;

    struct ArchiveEntry {
        string whistleblowerName;
        string caseLinked;
        string archiveType; // "Testimony", "Artifact", "Scrollchain exhibit"
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

    function archiveWhistleblower(string memory whistleblowerName, string memory caseLinked, string memory archiveType, string memory emotionalTag) external onlySteward {
        entries.push(ArchiveEntry(whistleblowerName, caseLinked, archiveType, emotionalTag, true, false));
    }

    function sealArchiveEntry(uint256 index) external onlySteward {
        require(entries[index].archived, "Must be archived first");
        entries[index].sealed = true;
    }

    function getArchiveEntry(uint256 index) external view returns (ArchiveEntry memory) {
        return entries[index];
    }
}
