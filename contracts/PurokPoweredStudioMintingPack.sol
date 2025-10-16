// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PurokPoweredStudioMintingPack {
    address public admin;

    struct MintEntry {
        string studioName;
        string purokLabel;
        string emotionalTag;
        bool minted;
        bool awarded;
    }

    MintEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function mintBadge(string memory studioName, string memory purokLabel, string memory emotionalTag) external onlyAdmin {
        entries.push(MintEntry(studioName, purokLabel, emotionalTag, true, false));
    }

    function awardBadge(uint256 index) external onlyAdmin {
        entries[index].awarded = true;
    }

    function getMintEntry(uint256 index) external view returns (MintEntry memory) {
        return entries[index];
    }
}
