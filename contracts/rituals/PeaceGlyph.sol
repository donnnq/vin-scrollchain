// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract PeaceGlyph is ERC721URIStorage, Ownable {
    uint256 public tokenCounter;

    struct PeaceEvent {
        string title;
        string description;
        string zone;
        uint256 timestamp;
        string glyphType;
    }

    mapping(uint256 => PeaceEvent) public peaceEvents;

    event PeaceGlyphMinted(uint256 indexed tokenId, string zone, string glyphType);

    constructor() ERC721("PeaceGlyph", "PEACE") {
        tokenCounter = 0;
    }

    /// @notice Mint a peace glyph NFT
    function mintPeaceGlyph(
        string memory title,
        string memory description,
        string memory zone,
        string memory glyphType,
        string memory tokenURI
    ) external onlyOwner {
        uint256 newTokenId = tokenCounter;

        _safeMint(msg.sender, newTokenId);
        _setTokenURI(newTokenId, tokenURI);

        peaceEvents[newTokenId] = PeaceEvent({
            title: title,
            description: description,
            zone: zone,
            timestamp: block.timestamp,
            glyphType: glyphType
        });

        emit PeaceGlyphMinted(newTokenId, zone, glyphType);
        tokenCounter++;
    }

    /// @notice View peace event metadata
    function getPeaceEvent(uint256 tokenId) external view returns (PeaceEvent memory) {
        return peaceEvents[tokenId];
    }
}
