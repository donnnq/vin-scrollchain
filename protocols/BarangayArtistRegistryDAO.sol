// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayArtistRegistryDAO {
    address public admin;

    struct ArtistEntry {
        string artistName;
        string barangay;
        string genre;
        string emotionalTag;
        bool summoned;
        bool verified;
        bool sealed;
    }

    ArtistEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonArtist(string memory artistName, string memory barangay, string memory genre, string memory emotionalTag) external onlyAdmin {
        entries.push(ArtistEntry(artistName, barangay, genre, emotionalTag, true, false, false));
    }

    function confirmVerification(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function sealArtistEntry(uint256 index) external onlyAdmin {
        require(entries[index].verified, "Must be verified first");
        entries[index].sealed = true;
    }

    function getArtistEntry(uint256 index) external view returns (ArtistEntry memory) {
        return entries[index];
    }
}
