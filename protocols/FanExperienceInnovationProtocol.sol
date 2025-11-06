// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FanExperienceInnovationProtocol {
    address public steward;

    struct ExperienceEntry {
        string arenaName;
        string innovationType;
        string accessibilityFeature;
        string emotionalTag;
    }

    ExperienceEntry[] public protocol;

    event FanExperienceTagged(string arenaName, string innovationType, string accessibilityFeature, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagExperience(
        string memory arenaName,
        string memory innovationType,
        string memory accessibilityFeature,
        string memory emotionalTag
    ) public onlySteward {
        protocol.push(ExperienceEntry(arenaName, innovationType, accessibilityFeature, emotionalTag));
        emit FanExperienceTagged(arenaName, innovationType, accessibilityFeature, emotionalTag);
    }
}
