// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ScrollParlorHub {
    struct GameSession {
        string gameType;
        address player;
        uint256 score;
        uint256 timestamp;
    }

    GameSession[] public sessions;
    mapping(address => uint256[]) public playerToSessions;

    event GamePlayed(string gameType, address indexed player, uint256 score);

    function playGame(string calldata gameType, uint256 score) external {
        sessions.push(GameSession(gameType, msg.sender, score, block.timestamp));
        playerToSessions[msg.sender].push(sessions.length - 1);
        emit GamePlayed(gameType, msg.sender, score);
    }

    function getMyGames() external view returns (uint256[] memory) {
        return playerToSessions[msg.sender];
    }
}
