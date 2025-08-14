// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title SoulboundWelcomeDeck - Ritualized onboarding for emotional safety
/// @notice Encodes civic vows, welcome blessings, and trust anchors

contract SoulboundWelcomeDeck {
    struct WelcomeScroll {
        string vow;
        string blessing;
        uint256 timestamp;
    }

    mapping(address => WelcomeScroll) public welcomeLedger;

    event WelcomeBlessed(address indexed user, string vow, string blessing);

    function blessWelcome(address _user, string memory _vow, string memory _blessing) external {
        welcomeLedger[_user] = WelcomeScroll(_vow, _blessing, block.timestamp);
        emit WelcomeBlessed(_user, _vow, _blessing);
    }

    function getWelcome(address _user) external view returns (WelcomeScroll memory) {
        return welcomeLedger[_user];
    }
}
