// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OrbitalThreatImmunityDAO {
    address public steward;

    struct ImmunityEntry {
        string satelliteSystem;
        string threatVector;
        string immunityMechanism;
        string emotionalTag;
    }

    ImmunityEntry[] public registry;

    event OrbitalThreatImmunityTagged(string satelliteSystem, string threatVector, string immunityMechanism, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagImmunity(
        string memory satelliteSystem,
        string memory threatVector,
        string memory immunityMechanism,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(ImmunityEntry(satelliteSystem, threatVector, immunityMechanism, emotionalTag));
        emit OrbitalThreatImmunityTagged(satelliteSystem, threatVector, immunityMechanism, emotionalTag);
    }
}
