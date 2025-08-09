// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ScholarBadge is ERC721URIStorage, Ownable {
    uint256 public tokenIdCounter;

    constructor() ERC721("ScholarBadge", "SBG") {}

    function mintBadge(address scholar, string memory tokenURI) public onlyOwner {
        uint256 newTokenId = tokenIdCounter;
        _safeMint(scholar, newTokenId);
        _setTokenURI(newTokenId, tokenURI);
        tokenIdCounter++;
    }

    function _beforeTokenTransfer(address from, address to, uint256 tokenId) internal override {
        require(from == address(0), "Soulbound: cannot transfer");
        super._beforeTokenTransfer(from, to, tokenId);
    }
}
