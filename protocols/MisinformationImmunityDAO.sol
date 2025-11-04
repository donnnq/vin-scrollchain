// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MisinformationImmunityDAO {
    address public steward;

    struct ImmunityEntry {
        string contentReference;
        string immunitySignal;
        string containmentMechanism;
        string emotionalTag;
    }

    ImmunityEntry[] public registry;

    event MisinformationImmunityTagged(string contentReference, string immunitySignal, string containmentMechanism, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagImmunity(
        string memory contentReference,
        string memory immunitySignal,
        string memory containmentMechanism,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(ImmunityEntry(contentReference, immunitySignal, containmentMechanism, emotionalTag));
        emit MisinformationImmunityTagged(contentReference, immunitySignal, containmentMechanism, emotionalTag);
    }
}
