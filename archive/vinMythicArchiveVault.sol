// SPDX-License-Identifier: Mythic-Planetary
pragma solidity ^0.8.19;

contract vinMythicArchiveVault {
    struct ArchiveEntry {
        string artifactName;
        string artifactType; // e.g. "Scroll", "Sigil", "Broadcast", "Bundle"
        string steward;
        string nanoPath;
        string legendNote;
        uint256 timestamp;
    }

    ArchiveEntry[] public archive;

    event ArtifactArchived(string artifactName, string steward, string legendNote);

    function archiveArtifact(
        string memory artifactName,
        string memory artifactType,
        string memory steward,
        string memory nanoPath,
        string memory legendNote
    ) public {
        archive.push(ArchiveEntry(artifactName, artifactType, steward, nanoPath, legendNote, block.timestamp));
        emit ArtifactArchived(artifactName, steward, legendNote);
    }

    function getArchive() public view returns (ArchiveEntry[] memory) {
        return archive;
    }
}
