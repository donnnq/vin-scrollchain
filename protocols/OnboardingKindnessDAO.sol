// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OnboardingKindnessDAO {
    address public steward;

    struct KindnessEntry {
        string crewName;
        string onboardingMoment;
        string kindnessGesture;
        string emotionalTag;
    }

    KindnessEntry[] public registry;

    event OnboardingKindnessTagged(string crewName, string onboardingMoment, string kindnessGesture, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagKindness(
        string memory crewName,
        string memory onboardingMoment,
        string memory kindnessGesture,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(KindnessEntry(crewName, onboardingMoment, kindnessGesture, emotionalTag));
        emit OnboardingKindnessTagged(crewName, onboardingMoment, kindnessGesture, emotionalTag);
    }
}
