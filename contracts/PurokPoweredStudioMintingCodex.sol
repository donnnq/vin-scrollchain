// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PurokPoweredStudioMintingCodex {
    address public admin;

    struct MintEntry {
        string studioName;
        string purokLabel;
        string emotionalTag;
        bool minted;
        bool archived;
    }

    MintEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function mintStudioBadge(string memory studioName, string memory purokLabel, string memory emotionalTag) external onlyAdmin {
        entries.push(MintEntry(studioName, purokLabel, emotionalTag, true, false));
    }

    function archiveMint(uint256 index) external onlyAdmin {
        entries[index].archived = true;
    }

    function getMintEntry(uint256 index) external view returns (MintEntry memory) {
        return entries[index];
    }
}
