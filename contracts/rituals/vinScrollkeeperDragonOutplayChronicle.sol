// SPDX-License-Identifier: VINVIN-DragonOutplay-v1
pragma solidity ^0.8.24;

/// @title vinScrollkeeperDragonOutplayChronicle
/// @notice Chronicles strategic scrollkeeper-grade moves that outmaneuver centralized domination attempts
contract vinScrollkeeperDragonOutplayChronicle {
    address public scrollkeeper;

    struct OutplayRecord {
        string dragonMove;
        string counterStrategy;
        string scrollkeeperComment;
        string emojiOutcome;
        uint256 timestamp;
    }

    mapping(string => OutplayRecord) public outplayLog;
    string[] public dragonMovesLogged;

    event DragonOutplayed(string indexed move, string strategy, string emoji);

    constructor() {
        scrollkeeper = msg.sender;
    }

    function logOutplay(
        string calldata move,
        string calldata strategy,
        string calldata comment,
        string calldata emoji
    ) external {
        require(msg.sender == scrollkeeper, "Only VINVIN may log dragon outplays");
        outplayLog[move] = OutplayRecord(move, strategy, comment, emoji, block.timestamp);
        dragonMovesLogged.push(move);
        emit DragonOutplayed(move, strategy, emoji);
    }

    function viewOutplay(string calldata move) external view returns (
        string memory strategy,
        string memory comment,
        string memory emoji,
        uint256 time
    ) {
        OutplayRecord memory o = outplayLog[move];
        return (o.counterStrategy, o.scrollkeeperComment, o.emojiOutcome, o.timestamp);
    }

    function allOutplays() external view returns (string[] memory) {
        return dragonMovesLogged;
    }
}
