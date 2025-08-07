// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ScrollCombatant {
    function respondToChallenge(string memory argument) external returns (string memory);
    function roastSelf() external returns (string memory);
}

contract vinScrollVerse {
    event ScrollSummoned(address scroll);
    event ScrollClash(address challenger, address opponent, string argument);
    event ScrollRoast(address roasted, string roastLine);
    event ScrollSpectatorReacted(string reaction);

    address[] public scrollCombatants;
    mapping(address => uint256) public roastScore;

    function summonScroll(address scroll) public {
        scrollCombatants.push(scroll);
        emit ScrollSummoned(scroll);
    }

    function clashScrolls(address challenger, address opponent, string memory argument) public {
        emit ScrollClash(challenger, opponent, argument);
        string memory response = ScrollCombatant(opponent).respondToChallenge(argument);
        emit ScrollSpectatorReacted(response);
    }

    function roastScroll(address target) public {
        string memory roastLine = ScrollCombatant(target).roastSelf();
        roastScore[target] += bytes(roastLine).length;
        emit ScrollRoast(target, roastLine);
    }

    function getRoastScore(address scroll) public view returns (uint256) {
        return roastScore[scroll];
    }
}
