// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ApolloGalleryDAO {
    address public admin;

    struct GalleryEntry {
        string galleryName;
        string breachMethod;
        string artifactType;
        string emotionalTag;
        bool summoned;
        bool reinforced;
        bool sealed;
    }

    GalleryEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonGallery(string memory galleryName, string memory breachMethod, string memory artifactType, string memory emotionalTag) external onlyAdmin {
        entries.push(GalleryEntry(galleryName, breachMethod, artifactType, emotionalTag, true, false, false));
    }

    function confirmReinforcement(uint256 index) external onlyAdmin {
        entries[index].reinforced = true;
    }

    function sealGalleryEntry(uint256 index) external onlyAdmin {
        require(entries[index].reinforced, "Must be reinforced first");
        entries[index].sealed = true;
    }

    function getGalleryEntry(uint256 index) external view returns (GalleryEntry memory) {
        return entries[index];
    }
}
