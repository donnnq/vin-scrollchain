// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title LambingNFT - Soulbound token of civic affection for citizens who overcome envy with grace
/// @author Vinvin
/// @notice Minted as a badge of emotional resilience and community healing

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract LambingNFT is ERC721URIStorage, Ownable {
    uint256 public tokenIdCounter;
    mapping(address => bool) public hasMinted;

    constructor() ERC721("LambingNFT", "LMBG") {}

    /// @notice Mint a soulbound lambing token
    function mintLambing(address to, string memory tokenURI) external onlyOwner {
        require(!hasMinted[to], "Already received lambing");
        uint256 newId = tokenIdCounter;
        _mint(to, newId);
        _setTokenURI(newId, tokenURI);
        hasMinted[to] = true;
        tokenIdCounter++;
    }

    /// @dev Override to make token soulbound (non-transferable)
    function _beforeTokenTransfer(address from, address to, uint256 tokenId) internal pure override {
        require(from == address(0), "Soulbound: cannot transfer");
    }
}
