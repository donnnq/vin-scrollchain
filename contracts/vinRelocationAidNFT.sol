// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract vinRelocationAidNFT is ERC721URIStorage, Ownable {
    uint256 public tokenCounter;
    mapping(uint256 => bool) public isSoulbound;

    constructor() ERC721("vinRelocationAidNFT", "VRA") {
        tokenCounter = 0;
    }

    function mintRelocationToken(address recipient, string memory tokenURI) public onlyOwner returns (uint256) {
        uint256 newTokenId = tokenCounter;
        _safeMint(recipient, newTokenId);
        _setTokenURI(newTokenId, tokenURI);
        isSoulbound[newTokenId] = true;
        tokenCounter++;
        return newTokenId;
    }

    function _beforeTokenTransfer(address from, address to, uint256 tokenId) internal override {
        require(!isSoulbound[tokenId] || from == address(0), "Soulbound: cannot transfer");
        super._beforeTokenTransfer(from, to, tokenId);
    }

    function burnToken(uint256 tokenId) public {
        require(ownerOf(tokenId) == msg.sender, "Not token owner");
        _burn(tokenId);
    }
}
