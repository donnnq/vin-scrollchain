// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AILiteracyImmunityCodex {
    address public steward;

    struct ImmunityEntry {
        string barangay;
        string literacyDomain;
        string immunityMechanism;
        string emotionalTag;
    }

    ImmunityEntry[] public codex;

    event AILiteracyImmunityTagged(string barangay, string literacyDomain, string immunityMechanism, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagImmunity(
        string memory barangay,
        string memory literacyDomain,
        string memory immunityMechanism,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(ImmunityEntry(barangay, literacyDomain, immunityMechanism, emotionalTag));
        emit AILiteracyImmunityTagged(barangay, literacyDomain, immunityMechanism, emotionalTag);
    }
}
