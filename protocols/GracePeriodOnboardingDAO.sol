// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GracePeriodOnboardingDAO {
    address public steward;

    struct OnboardingEntry {
        string employerName;
        string sector;
        string gracePeriod;
        string emotionalTag;
    }

    OnboardingEntry[] public registry;

    event GracePeriodTagged(string employerName, string sector, string gracePeriod, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagGracePeriod(
        string memory employerName,
        string memory sector,
        string memory gracePeriod,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(OnboardingEntry(employerName, sector, gracePeriod, emotionalTag));
        emit GracePeriodTagged(employerName, sector, gracePeriod, emotionalTag);
    }
}
