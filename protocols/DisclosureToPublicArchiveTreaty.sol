// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DisclosureToPublicArchiveTreaty {
    address public steward;

    struct ArchiveEntry {
        string caseName; // "Villanueva reversal"
        string archiveMethod; // "Scrollchain broadcast", "Public repository", "Senate journal"
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

    function archiveDisclosure(string memory caseName, string memory archiveMethod, string memory emotionalTag) external onlySteward {
        entries.push(ArchiveEntry(caseName, archiveMethod, emotionalTag, true, false));
    }

    function sealArchiveEntry(uint256 index) external onlySteward {
        require(entries[index].archived, "Must be archived first");
        entries[index].sealed = true;
    }

    function getArchiveEntry(uint256 index) external view returns (ArchiveEntry memory) {
        return entries[index];
    }
}
