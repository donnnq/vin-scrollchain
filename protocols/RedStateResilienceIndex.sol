// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RedStateResilienceIndex {
    address public steward;

    struct ResilienceEntry {
        string stateName;
        string economicSignal;
        string migrationAbsorptionRate;
        string emotionalTag;
    }

    ResilienceEntry[] public index;

    event RedStateResilienceTagged(string stateName, string economicSignal, string migrationAbsorptionRate, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagResilience(
        string memory stateName,
        string memory economicSignal,
        string memory migrationAbsorptionRate,
        string memory emotionalTag
    ) public onlySteward {
        index.push(ResilienceEntry(stateName, economicSignal, migrationAbsorptionRate, emotionalTag));
        emit RedStateResilienceTagged(stateName, economicSignal, migrationAbsorptionRate, emotionalTag);
    }
}
