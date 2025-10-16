// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PHArtisanDAO {
    address public admin;

    struct ArtisanEntry {
        string artisanLabel;
        string craftClause;
        string emotionalTag;
        bool empowered;
    }

    ArtisanEntry[] public artisans;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _artisanLabel, string memory _craftClause, string memory _emotionalTag) external onlyAdmin {
        artisans.push(ArtisanEntry(_artisanLabel, _craftClause, _emotionalTag, false));
    }

    function empowerEntry(uint256 index) external onlyAdmin {
        artisans[index].empowered = true;
    }

    function getEntry(uint256 index) external view returns (ArtisanEntry memory) {
        return artisans[index];
    }
}
