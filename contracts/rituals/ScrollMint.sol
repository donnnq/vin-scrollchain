// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

interface IGlyphReport {
    function generateGlyph(string memory barangay) external returns (string memory);
}

contract ScrollMint is ERC721URIStorage, Ownable {
    IGlyphReport public glyphReport;
    uint256 public tokenCounter;

    constructor(address glyphReportAddress) ERC721("ScrollGlyph", "GLYPH") {
        glyphReport = IGlyphReport(glyphReportAddress);
        tokenCounter = 0;
    }

    /// @notice Mint a soulbound glyph NFT for a barangay
    function mintGlyph(string memory barangay, string memory tokenURI) external onlyOwner {
        string memory glyphType = glyphReport.generateGlyph(barangay);

        uint256 newTokenId = tokenCounter;
        _safeMint(msg.sender, newTokenId);
        _setTokenURI(newTokenId, tokenURI);

        tokenCounter++;
    }

    /// @notice Override transfer to make NFTs soulbound
    function _beforeTokenTransfer(address from, address to, uint256 tokenId) internal pure override {
        require(from == address(0), "Soulbound: cannot transfer");
    }
}
