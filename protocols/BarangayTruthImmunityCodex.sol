// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayTruthImmunityCodex {
    address public steward;

    struct ImmunityEntry {
        string barangay;
        string truthSignal;
        string immunityMechanism;
        string emotionalTag;
    }

    ImmunityEntry[] public codex;

    event TruthImmunityTagged(string barangay, string truthSignal, string immunityMechanism, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagImmunity(
        string memory barangay,
        string memory truthSignal,
        string memory immunityMechanism,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(ImmunityEntry(barangay, truthSignal, immunityMechanism, emotionalTag));
        emit TruthImmunityTagged(barangay, truthSignal, immunityMechanism, emotionalTag);
    }
}
