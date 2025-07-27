// SPDX-License-Identifier: PEACE
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract PeaceSummitNFT is ERC721URIStorage, Ownable {
    uint256 public tokenCounter;

    struct PeaceMedal {
        string nation;
        string summitDate;
        uint256 honorScore;
    }

    mapping(uint256 => PeaceMedal) public summitLedger;

    event SummitNFTMinted(uint256 indexed tokenId, string nation, uint256 honorScore);

    constructor() ERC721("PeaceSummitNFT", "PSN") {
        tokenCounter = 0;
    }

    function mintMedal(
        address recipient,
        string memory nation,
        string memory summitDate,
        uint256 honorScore,
        string memory tokenURI
    ) public onlyOwner {
        uint256 newTokenId = tokenCounter;
        _mint(recipient, newTokenId);
        _setTokenURI(newTokenId, tokenURI);

        summitLedger[newTokenId] = PeaceMedal(nation, summitDate, honorScore);
        emit SummitNFTMinted(newTokenId, nation, honorScore);
        tokenCounter++;
    }

    function viewMedal(uint256 tokenId) public view returns (PeaceMedal memory) {
        return summitLedger[tokenId];
    }
}
