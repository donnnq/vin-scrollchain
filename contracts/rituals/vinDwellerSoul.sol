// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract vinDwellerSoul is ERC721URIStorage, Ownable {
    uint256 public soulCount;
    mapping(uint256 => string) public dignityTag;
    mapping(uint256 => uint256) public dwellingScore;

    constructor() ERC721("vinDwellerSoul", "VDS") {}

    function mintSoul(address recipient, string memory _tag, string memory tokenURI, uint256 _score) public onlyOwner {
        soulCount++;
        _safeMint(recipient, soulCount);
        _setTokenURI(soulCount, tokenURI);
        dignityTag[soulCount] = _tag;
        dwellingScore[soulCount] = _score;
    }

    function getDwellerTag(uint256 tokenId) public view returns (string memory) {
        require(_exists(tokenId), "Soul does not exist");
        return dignityTag[tokenId];
    }

    function getDwellingScore(uint256 tokenId) public view returns (uint256) {
        require(_exists(tokenId), "Soul does not exist");
        return dwellingScore[tokenId];
    }

    function _beforeTokenTransfer(address from, address to, uint256 tokenId, uint256 batchSize) internal pure override {
        require(from == address(0), "vinDwellerSoul is soulbound and non-transferable");
    }

    function soulVerseTag() public pure returns (string memory) {
        return "vinDwellerSoul: Immortal Scroll Identity for Ethical Residency";
    }
}
