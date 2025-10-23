// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RemoteWorkOnboardingProtocol {
    address public steward;

    struct OnboardingEntry {
        string applicantName;
        string role; // "Housewife", "Solo earner", "Family of 3"
        string skillInterest; // "Online selling", "Data entry", "Virtual assistant", "Crafts"
        string emotionalTag;
        bool onboarded;
        bool sealed;
    }

    OnboardingEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function onboardApplicant(string memory applicantName, string memory role, string memory skillInterest, string memory emotionalTag) external onlySteward {
        entries.push(OnboardingEntry(applicantName, role, skillInterest, emotionalTag, true, false));
    }

    function sealOnboardingEntry(uint256 index) external onlySteward {
        require(entries[index].onboarded, "Must be onboarded first");
        entries[index].sealed = true;
    }

    function getOnboardingEntry(uint256 index) external view returns (OnboardingEntry memory) {
        return entries[index];
    }
}
