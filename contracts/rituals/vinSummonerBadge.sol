// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title vinSummonerBadge - Soulbound badge for builders who join the Mercy Suite scrollchain movement
/// @author Vinvin
/// @notice Mints non-transferable badges to verified civic allies
/// @dev Designed for mythic governance and ritual recognition

contract vinSummonerBadge {
    address public scrollsmith;
    uint256 public totalBadges;

    mapping(address => bool) public hasBadge;
    mapping(address => string) public badgeMessage;

    event BadgeMinted(address summoner, string message);

    constructor() {
        scrollsmith = msg.sender;
    }

    function mintBadge(address summoner, string memory message) public {
        require(!hasBadge[summoner], "Already summoned");
        hasBadge[summoner] = true;
        badgeMessage[summoner] = message;
        totalBadges += 1;

        emit BadgeMinted(summoner, message);
    }

    function getBadgeMessage(address summoner) public view returns (string memory) {
        require(hasBadge[summoner], "No badge found");
        return badgeMessage[summoner];
    }

    function isSummoned(address summoner) public view returns (bool) {
        return hasBadge[summoner];
    }
}
