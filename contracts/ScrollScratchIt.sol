// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title ScrollScratchIt
/// @notice Scratch-card mini-game: play, wait, then reveal a prize.
contract ScrollScratchIt {
    struct Scratch {
        bool revealed;
        uint256 revealTime;
        bytes32 seed;
    }

    mapping(address => Scratch[]) public scratches;
    bytes32 private randNonce;

    event ScratchPlayed(address indexed player, uint256 indexed scratchId, uint256 revealTime);
    event PrizeRevealed(address indexed player, uint256 indexed scratchId, string prize);

    string[] private prizes = [
        "Common Loot", 
        "Rare Gem", 
        "Guardian's Blessing", 
        "Mythic Sigil"
    ];

    /// @notice Initiate a scratch-card play. Returns the new scratchId.
    function playScratch() external returns (uint256) {
        randNonce = keccak256(abi.encodePacked(block.timestamp, msg.sender, randNonce));
        uint256 id = scratches[msg.sender].length;
        uint256 readyAt = block.timestamp + 1 minutes; // delay for suspense
        scratches[msg.sender].push(Scratch(false, readyAt, randNonce));
        emit ScratchPlayed(msg.sender, id, readyAt);
        return id;
    }

    /// @notice After the revealTime, unveil your prize.
    function revealPrize(uint256 scratchId) external {
        Scratch storage s = scratches[msg.sender][scratchId];
        require(!s.revealed, "Already revealed");
        require(block.timestamp >= s.revealTime, "Too early to reveal");

        uint256 index = uint256(
            keccak256(abi.encodePacked(s.seed, block.timestamp))
        ) % prizes.length;

        s.revealed = true;
        emit PrizeRevealed(msg.sender, scratchId, prizes[index]);
    }

    /// @notice How many scratches has a user played?
    function getScratchCount(address user) external view returns (uint256) {
        return scratches[user].length;
    }
}
