// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OrbitalDebrisImmunityDAO {
    address public steward;

    struct ImmunityEntry {
        string debrisSource;
        string immunitySignal;
        string containmentMechanism;
        string emotionalTag;
    }

    ImmunityEntry[] public registry;

    event OrbitalDebrisImmunityTagged(string debrisSource, string immunitySignal, string containmentMechanism, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagImmunity(
        string memory debrisSource,
        string memory immunitySignal,
        string memory containmentMechanism,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(ImmunityEntry(debrisSource, immunitySignal, containmentMechanism, emotionalTag));
        emit OrbitalDebrisImmunityTagged(debrisSource, immunitySignal, containmentMechanism, emotionalTag);
    }
}
