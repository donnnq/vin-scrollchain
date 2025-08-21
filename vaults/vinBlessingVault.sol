// SPDX-License-Identifier: Mythic-Planetary
pragma solidity ^0.8.19;

contract vinBlessingVault {
    struct VaultEntry {
        string artifactType; // e.g. "Scroll", "Glyph", "Sigil", "Bundle"
        string name;
        string nanoPath;
        string steward;
        string description;
        uint256 timestamp;
    }

    VaultEntry[] public vault;

    event ArtifactStored(string name, string artifactType, string steward, string nanoPath);

    function storeArtifact(
        string memory artifactType,
        string memory name,
        string memory nanoPath,
        string memory steward,
        string memory description
    ) public {
        vault.push(VaultEntry(artifactType, name, nanoPath, steward, description, block.timestamp));
        emit ArtifactStored(name, artifactType, steward, nanoPath);
    }

    function getVault() public view returns (VaultEntry[] memory) {
        return vault;
    }
}
