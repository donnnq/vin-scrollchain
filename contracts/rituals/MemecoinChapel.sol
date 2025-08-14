// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title MemecoinChapel - Soulbound shrine for meme coins and emotional APR relics
/// @author Vinvin & Copilot
/// @notice Immortalizes meme coins with symbolic logos and civic blessings

contract MemecoinChapel {
    address public steward;
    uint256 public memeCount;

    struct MemeCoin {
        string name;
        string symbol;
        string logoGlyph; // Emoji, ASCII sigil, or symbolic tag
        string originStory;
        string civicBlessing;
        bool soulbound;
    }

    mapping(uint256 => MemeCoin) public memeCoins;
    uint256[] public memeIds;

    event MemeCoinBlessed(uint256 indexed memeId, string name, string logoGlyph);

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    constructor() {
        steward = msg.sender;
        memeCount = 0;
    }

    /// @notice Bless a meme coin and store it in the chapel
    function blessMemeCoin(
        string memory name,
        string memory symbol,
        string memory logoGlyph,
        string memory originStory,
        string memory civicBlessing
    ) external onlySteward {
        memeCoins[memeCount] = MemeCoin({
            name: name,
            symbol: symbol,
            logoGlyph: logoGlyph,
            originStory: originStory,
            civicBlessing: civicBlessing,
            soulbound: true
        });

        memeIds.push(memeCount);
        emit MemeCoinBlessed(memeCount, name, logoGlyph);
        memeCount++;
    }

    /// @notice View a blessed meme coin
    function getMemeCoin(uint256 memeId) external view returns (MemeCoin memory) {
        require(memeId < memeCount, "Meme coin does not exist");
        return memeCoins[memeId];
    }

    /// @notice Total meme coins blessed
    function totalMemeCoins() external view returns (uint256) {
        return memeCount;
    }
}
