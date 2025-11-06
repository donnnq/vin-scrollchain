// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ICEVisibilityResonanceTreaty {
    address public steward;

    struct VisibilityEntry {
        string enforcementAgency;
        string visibilityLevel;
        string publicSafetyImpact;
        string emotionalTag;
    }

    VisibilityEntry[] public treaty;

    event ICEVisibilityTagged(string enforcementAgency, string visibilityLevel, string publicSafetyImpact, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagVisibility(
        string memory enforcementAgency,
        string memory visibilityLevel,
        string memory publicSafetyImpact,
        string memory emotionalTag
    ) public onlySteward {
        treaty.push(VisibilityEntry(enforcementAgency, visibilityLevel, publicSafetyImpact, emotionalTag));
        emit ICEVisibilityTagged(enforcementAgency, visibilityLevel, publicSafetyImpact, emotionalTag);
    }
}
