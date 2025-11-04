// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CosmicHoaxImmunityDAO {
    address public steward;

    struct ImmunityEntry {
        string hoaxReference;
        string immunitySignal;
        string containmentMechanism;
        string emotionalTag;
    }

    ImmunityEntry[] public registry;

    event CosmicHoaxImmunityTagged(string hoaxReference, string immunitySignal, string containmentMechanism, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagImmunity(
        string memory hoaxReference,
        string memory immunitySignal,
        string memory containmentMechanism,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(ImmunityEntry(hoaxReference, immunitySignal, containmentMechanism, emotionalTag));
        emit CosmicHoaxImmunityTagged(hoaxReference, immunitySignal, containmentMechanism, emotionalTag);
    }
}
