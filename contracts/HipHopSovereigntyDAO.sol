// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HipHopSovereigntyDAO {
    address public admin;

    struct ArtistEntry {
        string artistLabel;
        string contributionType;
        string emotionalTag;
        bool honored;
        bool archived;
    }

    ArtistEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitArtist(string memory artistLabel, string memory contributionType, string memory emotionalTag) external onlyAdmin {
        entries.push(ArtistEntry(artistLabel, contributionType, emotionalTag, false, false));
    }

    function honorArtist(uint256 index) external onlyAdmin {
        entries[index].honored = true;
    }

    function archiveArtist(uint256 index) external onlyAdmin {
        entries[index].archived = true;
    }

    function getArtist(uint256 index) external view returns (ArtistEntry memory) {
        return entries[index];
    }
}
