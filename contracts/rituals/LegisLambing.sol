// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title LegisLambing - Ritual module that rewards lawmakers for passing dignity-enhancing proposals
/// @author Vinvin
/// @notice Mints SoulBadges for lawmakers who legislate with empathy and style

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract LegisLambing is ERC721URIStorage, Ownable {
    uint256 public badgeCounter;
    mapping(address => bool) public hasBadge;

    constructor() ERC721("LegisLambingBadge", "LLB") {}

    /// @notice Mint a lambing badge to a lawmaker
    function mintBadge(address lawmaker, string memory uri) external onlyOwner {
        require(!hasBadge[lawmaker], "Already awarded");
        _mint(lawmaker, badgeCounter);
        _setTokenURI(badgeCounter, uri);
        hasBadge[lawmaker] = true;
        badgeCounter++;
    }

    /// @dev Soulbound override
    function _beforeTokenTransfer(address from, address to, uint256 tokenId) internal pure override {
        require(from == address(0), "Soulbound: cannot transfer");
    }
}
