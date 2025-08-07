// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract vinGlobalGameAtlasNFT is ERC721URIStorage, Ownable {
    uint256 public nextTokenId;
    mapping(uint256 => string) public strategyArchetypes;

    constructor() ERC721("GlobalGameAtlasNFT", "GGA") {}

    function mintSigil(string memory archetypeName, string memory tokenURI) external onlyOwner {
        strategyArchetypes[nextTokenId] = archetypeName;
        _safeMint(msg.sender, nextTokenId);
        _setTokenURI(nextTokenId, tokenURI);
        nextTokenId++;
    }

    function updateSigilURI(uint256 tokenId, string memory newURI) external onlyOwner {
        _setTokenURI(tokenId, newURI);
    }

    function getArchetype(uint256 tokenId) external view returns (string memory) {
        return strategyArchetypes[tokenId];
    }
}
