// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/// @title GeoBlessingNFT - Soulbound NFT for verified safe zones and stewarded regions
contract GeoBlessingNFT is ERC721URIStorage, Ownable {
    uint256 public tokenCounter;
    mapping(uint256 => bool) public soulbound;
    mapping(string => bool) public blessedRegion;

    event RegionBlessed(string region, uint256 tokenId, string ritual);

    constructor() ERC721("GeoBlessingNFT", "GBNFT") {
        tokenCounter = 1;
    }

    function blessRegion(address recipient, string calldata region, string calldata tokenURI) external onlyOwner {
        require(!blessedRegion[region], "Region already blessed");

        uint256 newTokenId = tokenCounter;
        _safeMint(recipient, newTokenId);
        _setTokenURI(newTokenId, tokenURI);
        soulbound[newTokenId] = true;
        blessedRegion[region] = true;

        emit RegionBlessed(region, newTokenId, "🕊️ Geo-blessing ritual complete");

        tokenCounter++;
    }

    /// @dev Override transfer functions to enforce soulbound behavior
    function _beforeTokenTransfer(address from, address to, uint256 tokenId) internal override {
        require(from == address(0) || to == address(0), "Soulbound: cannot transfer");
        super._beforeTokenTransfer(from, to, tokenId);
    }
}
