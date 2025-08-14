// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title SoulboundWelcomeDeck - Ritual onboarding for returning immigrants
/// @author Vinvin & Copilot
/// @notice Encodes civic vows, emotional restoration, and re-entry privileges

contract SoulboundWelcomeDeck {
    address public steward;

    struct WelcomeCard {
        string name;
        string originCountry;
        string civicVow;
        bool onboarded;
        bool receivedBlessings;
    }

    mapping(address => WelcomeCard) public welcomeCards;
    address[] public onboardedCitizens;

    event Onboarded(address indexed citizen, string vow);
    event BlessingsGranted(address indexed citizen);

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function issueWelcomeCard(address citizen, string memory name, string memory originCountry, string memory civicVow) external onlySteward {
        welcomeCards[citizen] = WelcomeCard({
            name: name,
            originCountry: originCountry,
            civicVow: civicVow,
            onboarded: true,
            receivedBlessings: false
        });
        onboardedCitizens.push(citizen);
        emit Onboarded(citizen, civicVow);
    }

    function grantBlessings(address citizen) external onlySteward {
        require(welcomeCards[citizen].onboarded, "Not onboarded yet");
        welcomeCards[citizen].receivedBlessings = true;
        emit BlessingsGranted(citizen);
    }

    function getWelcomeCard(address citizen) external view returns (WelcomeCard memory) {
        return welcomeCards[citizen];
    }

    function totalOnboarded() external view returns (uint256) {
        return onboardedCitizens.length;
    }
}
