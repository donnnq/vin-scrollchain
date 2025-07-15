// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ScrollTetrisArena {
    struct Match {
        address player1;
        address player2;
        uint256 taya;
        bool active;
    }

    Match[] public matches;
    mapping(address => uint256) public balances;

    event MatchCreated(uint256 matchId, address indexed player1, uint256 taya);
    event MatchJoined(uint256 matchId, address indexed player2);
    event MatchResolved(uint256 matchId, address winner);

    function createMatch(uint256 taya) external payable {
        require(msg.value == taya, "Taya mismatch");
        balances[msg.sender] += taya;

        matches.push(Match(msg.sender, address(0), taya, true));
        emit MatchCreated(matches.length - 1, msg.sender, taya);
    }

    function joinMatch(uint256 matchId) external payable {
        Match storage m = matches[matchId];
        require(m.active && m.player2 == address(0), "Match unavailable");
        require(msg.value == m.taya, "Taya mismatch");

        m.player2 = msg.sender;
        balances[msg.sender] += m.taya;

        emit MatchJoined(matchId, msg.sender);
    }

    function resolveMatch(uint256 matchId, address winner) external {
        Match storage m = matches[matchId];
        require(m.active && (winner == m.player1 || winner == m.player2), "Invalid winner");

        balances[winner] += m.taya * 2;
        m.active = false;

        emit MatchResolved(matchId, winner);
    }

    function withdraw() external {
        uint256 amount = balances[msg.sender];
        require(amount > 0, "No balance");
        balances[msg.sender] = 0;
        payable(msg.sender).transfer(amount);
    }
}
