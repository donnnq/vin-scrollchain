// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title ScrollLucky2
/// @notice A simple 2-digit daily lotto system with entry, draw, and prize distribution.
contract ScrollLucky2 {
    uint256 public constant ENTRY_FEE = 0.001 ether;
    uint256 public drawDate;
    uint256 public lastDrawAt;
    uint8 public winningTens;
    uint8 public winningUnits;

    struct Entry {
        uint8 tens;
        uint8 units;
        bool claimed;
    }

    mapping(address => Entry[]) public entries;
    mapping(uint256 => address[]) public winners;

    event EntrySubmitted(address indexed player, uint8 tens, uint8 units);
    event DrawPerformed(uint8 winningTens, uint8 winningUnits, uint256 timestamp);
    event PrizeClaimed(address indexed player, uint256 drawDate, uint256 amount);

    constructor() {
        drawDate = block.timestamp;
        lastDrawAt = block.timestamp;
    }

    /// @notice Submit a 2-digit entry. Fee required.
    function submitEntry(uint8 tens, uint8 units) external payable {
        require(msg.value == ENTRY_FEE, "Invalid entry fee");
        require(tens < 10 && units < 10, "Digits 0–9 only");

        entries[msg.sender].push(Entry(tens, units, false));
        emit EntrySubmitted(msg.sender, tens, units);
    }

    /// @notice Perform a daily draw (callable once every 24h).
    function drawLotto() external {
        require(block.timestamp >= lastDrawAt + 1 days, "Too soon for next draw");

        // pseudo-randomness for demo; replace with secure RNG in production
        bytes32 seed = keccak256(abi.encodePacked(block.timestamp, msg.sender));
        winningTens = uint8(uint256(seed) % 10);
        winningUnits = uint8((uint256(seed) / 100) % 10);

        lastDrawAt = block.timestamp;
        drawDate = block.timestamp;

        // collect winners
        for (uint i = 0; i < 10; i++) {
            // placeholder: in production, index through participants list
        }

        emit DrawPerformed(winningTens, winningUnits, drawDate);
    }

    /// @notice Claim prize if you matched today’s 2-digit combo.
    function claimPrize() external {
        Entry[] storage userEntries = entries[msg.sender];
        uint256 prize = 0;
        for (uint i = 0; i < userEntries.length; i++) {
            Entry storage e = userEntries[i];
            if (!e.claimed && e.tens == winningTens && e.units == winningUnits) {
                prize += ENTRY_FEE * 8; // 8× payout
                e.claimed = true;
            }
        }
        require(prize > 0, "No matching entries");
        payable(msg.sender).transfer(prize);
        winners[drawDate].push(msg.sender);
        emit PrizeClaimed(msg.sender, drawDate, prize);
    }

    /// @notice Get number of entries a user sent.
    function getEntryCount(address user) external view returns (uint256) {
        return entries[user].length;
    }
}
