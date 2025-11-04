// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayMemeImmunityCodex {
    address public steward;

    struct ImmunityEntry {
        string barangay;
        string memeSignal;
        string immunityMechanism;
        string emotionalTag;
    }

    ImmunityEntry[] public codex;

    event MemeImmunityTagged(string barangay, string memeSignal, string immunityMechanism, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagImmunity(
        string memory barangay,
        string memory memeSignal,
        string memory immunityMechanism,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(ImmunityEntry(barangay, memeSignal, immunityMechanism, emotionalTag));
        emit MemeImmunityTagged(barangay, memeSignal, immunityMechanism, emotionalTag);
    }
}
