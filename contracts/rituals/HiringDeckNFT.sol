// SPDX-License-Identifier: Mythic-Hiring
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract HiringDeckNFT is ERC721URIStorage, Ownable {
    uint256 public deckCount;

    struct Deck {
        string role;
        string perks;
        string civicVow;
        uint256 emotionalAPR;
        bool soulbound;
    }

    mapping(uint256 => Deck) public decks;
    mapping(address => uint256[]) public workerDecks;

    event DeckMinted(address indexed worker, uint256 deckId, string role);

    constructor() ERC721("HiringDeckNFT", "HDNFT") {}

    /// @notice Mint a soulbound hiring deck NFT
    function mintDeck(
        address worker,
        string memory role,
        string memory perks,
        string memory civicVow,
        uint256 emotionalAPR,
        string memory tokenURI
    ) external onlyOwner {
        uint256 deckId = deckCount;
        _mint(worker, deckId);
        _setTokenURI(deckId, tokenURI);

        decks[deckId] = Deck({
            role: role,
            perks: perks,
            civicVow: civicVow,
            emotionalAPR: emotionalAPR,
            soulbound: true
        });

        workerDecks[worker].push(deckId);
        deckCount++;

        emit DeckMinted(worker, deckId, role);
    }

    /// @notice Override transfer to enforce soulbound behavior
    function _beforeTokenTransfer(address from, address to, uint256 tokenId) internal override {
        require(from == address(0), "Soulbound: cannot transfer");
        super._beforeTokenTransfer(from, to, tokenId);
    }

    /// @notice View all decks for a worker
    function getWorkerDecks(address worker) external view returns (uint256[] memory) {
        return workerDecks[worker];
    }

    /// @notice View deck details
    function getDeck(uint256 deckId) external view returns (Deck memory) {
        return decks[deckId];
    }
}
