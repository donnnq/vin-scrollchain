// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FerryArtDAO {
    address public admin;

    struct ArtEntry {
        string vesselName;
        string artistName;
        string artTheme;
        string emotionalTag;
        bool summoned;
        bool painted;
        bool sealed;
    }

    ArtEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonArt(string memory vesselName, string memory artistName, string memory artTheme, string memory emotionalTag) external onlyAdmin {
        entries.push(ArtEntry(vesselName, artistName, artTheme, emotionalTag, true, false, false));
    }

    function confirmPainting(uint256 index) external onlyAdmin {
        entries[index].painted = true;
    }

    function sealArtEntry(uint256 index) external onlyAdmin {
        require(entries[index].painted, "Must be painted first");
        entries[index].sealed = true;
    }

    function getArtEntry(uint256 index) external view returns (ArtEntry memory) {
        return entries[index];
    }
}
