// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ScrollCombatant {
    function respondToChallenge(string memory argument) external returns (string memory);
}

contract vinScrollArena {
    event ChallengeIssued(address challenger, address opponent, string argument);
    event ResponseLogged(address opponent, string response);

    function issueChallenge(address opponent, string memory argument) public {
        emit ChallengeIssued(msg.sender, opponent, argument);
        string memory response = ScrollCombatant(opponent).respondToChallenge(argument);
        emit ResponseLogged(opponent, response);
    }
}
