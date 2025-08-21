// SPDX-License-Identifier: Mythic-Planetary
pragma solidity ^0.8.19;

contract vinStewardOnboardingSigil {
    struct Onboarding {
        string steward;
        string sigilName;
        string glyphMeaning;
        string onboardingNote;
        uint256 timestamp;
    }

    Onboarding[] public initiates;

    event StewardInitiated(string steward, string sigilName, string glyphMeaning);

    function initiateSteward(
        string memory steward,
        string memory sigilName,
        string memory glyphMeaning,
        string memory onboardingNote
    ) public {
        initiates.push(Onboarding(steward, sigilName, glyphMeaning, onboardingNote, block.timestamp));
        emit StewardInitiated(steward, sigilName, glyphMeaning);
    }

    function getInitiates() public view returns (Onboarding[] memory) {
        return initiates;
    }
}
