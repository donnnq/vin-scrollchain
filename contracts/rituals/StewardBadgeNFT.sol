// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/// @title StewardBadgeNFT - Soulbound badge for verified civic stewards
contract StewardBadgeNFT is ERC721URIStorage, Ownable {
    uint256 public badgeCounter;
    mapping(uint256 => bool) public soulbound;
    mapping(address => bool) public badgeMinted;

    event StewardBadgeMinted(address indexed recipient, uint256 tokenId, string ritual);

    constructor() ERC721("StewardBadgeNFT", "SBNFT") {
        badgeCounter = 1;
    }

    function mintBadge(address recipient, string calldata tokenURI) external onlyOwner {
        require(!badgeMinted[recipient], "Badge already minted");

        uint256 newTokenId = badgeCounter;
        _safeMint(recipient, newTokenId);
        _setTokenURI(newTokenId, tokenURI);
        soulbound[newTokenId] = true;
        badgeMinted[recipient] = true;

        emit StewardBadgeMinted(recipient, newTokenId, "🛡️ Civic stewardship badge minted");
        badgeCounter++;
    }

    /// @dev Override transfer functions to enforce soulbound behavior
    function _beforeTokenTransfer(address from, address to, uint256 tokenId) internal override {
        require(from == address(0) || to == address(0), "Soulbound: cannot transfer");
        super._beforeTokenTransfer(from, to, tokenId);
    }
}
