// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract vinAssetProtectionNFT is ERC721URIStorage, Ownable {
    uint256 public tokenCounter;

    constructor() ERC721("VinvinAssetProtection", "VAP") {
        tokenCounter = 0;
    }

    function mintSoulbound(address recipient, string memory tokenURI) public onlyOwner returns (uint256) {
        uint256 newTokenId = tokenCounter;
        _safeMint(recipient, newTokenId);
        _setTokenURI(newTokenId, tokenURI);
        tokenCounter++;
        return newTokenId;
    }

    function _beforeTokenTransfer(address from, address to, uint256 tokenId) internal pure override {
        require(from == address(0), "Soulbound: non-transferable");
    }
}
