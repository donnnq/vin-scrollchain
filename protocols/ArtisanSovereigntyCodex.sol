// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArtisanSovereigntyCodex {
    address public admin;

    struct ArtisanEntry {
        string name;
        string craft;
        string origin;
        string emotionalTag;
        bool summoned;
        bool archived;
        bool protected;
    }

    ArtisanEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonArtisan(string memory name, string memory craft, string memory origin, string memory emotionalTag) external onlyAdmin {
        entries.push(ArtisanEntry(name, craft, origin, emotionalTag, true, false, false));
    }

    function archiveArtisan(uint256 index) external onlyAdmin {
        entries[index].archived = true;
    }

    function protectArtisan(uint256 index) external onlyAdmin {
        entries[index].protected = true;
    }

    function getArtisanEntry(uint256 index) external view returns (ArtisanEntry memory) {
        return entries[index];
    }
}
