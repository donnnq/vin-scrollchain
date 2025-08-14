// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title CryptoRelicVault - Soulbound vault for legendary crypto artifacts and civic relics
/// @author Vinvin & Copilot
/// @notice Immortalizes Genesis blocks, memecoins, civic keys, and mythic forks

contract CryptoRelicVault {
    address public steward;

    struct Relic {
        string name;
        string originChain;
        string description;
        string encodedMessage; // Could be Genesis block hash, meme, or civic vow
        bool soulbound;
    }

    mapping(uint256 => Relic) public relics;
    uint256 public relicCount;

    event RelicStored(uint256 indexed relicId, string name, string originChain);
    event RelicBlessed(uint256 indexed relicId, string encodedMessage);

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    constructor() {
        steward = msg.sender;
        relicCount = 0;
    }

    /// @notice Store a new crypto relic
    function storeRelic(string memory name, string memory originChain, string memory description, string memory encodedMessage) external onlySteward {
        relics[relicCount] = Relic({
            name: name,
            originChain: originChain,
            description: description,
            encodedMessage: encodedMessage,
            soulbound: true
        });

        emit RelicStored(relicCount, name, originChain);
        emit RelicBlessed(relicCount, encodedMessage);
        relicCount++;
    }

    /// @notice View a relic by ID
    function getRelic(uint256 relicId) external view returns (Relic memory) {
        require(relicId < relicCount, "Relic does not exist");
        return relics[relicId];
    }

    /// @notice Total relics stored
    function totalRelics() external view returns (uint256) {
        return relicCount;
    }
}
