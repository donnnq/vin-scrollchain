// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract vin_scrollPurityBadge is ERC721, Ownable {
    uint256 public nextToken;
    mapping(address => bool) public hasBadge;

    event PurityBadgeMinted(address indexed contractAddr, uint256 tokenId);

    constructor() ERC721("ScrollPurityBadge", "SPB") {}

    function mintBadge(address contractAddr) external onlyOwner {
        require(!hasBadge[contractAddr], "Badge already minted");
        uint256 tokenId = nextToken++;
        _safeMint(contractAddr, tokenId);
        hasBadge[contractAddr] = true;
        emit PurityBadgeMinted(contractAddr, tokenId);
    }

    function badgeOf(address contractAddr) external view returns (uint256) {
        require(hasBadge[contractAddr], "No badge");
        return tokenOfOwnerByIndex(contractAddr, 0);
    }
}
