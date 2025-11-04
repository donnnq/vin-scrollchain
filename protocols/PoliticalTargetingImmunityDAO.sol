// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PoliticalTargetingImmunityDAO {
    address public steward;

    struct ImmunityEntry {
        string individual;
        string targetingSignal;
        string immunityMechanism;
        string emotionalTag;
    }

    ImmunityEntry[] public registry;

    event PoliticalTargetingImmunityTagged(string individual, string targetingSignal, string immunityMechanism, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagImmunity(
        string memory individual,
        string memory targetingSignal,
        string memory immunityMechanism,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(ImmunityEntry(individual, targetingSignal, immunityMechanism, emotionalTag));
        emit PoliticalTargetingImmunityTagged(individual, targetingSignal, immunityMechanism, emotionalTag);
    }
}
