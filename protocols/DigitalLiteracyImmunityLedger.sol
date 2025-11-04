// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DigitalLiteracyImmunityLedger {
    address public steward;

    struct ImmunityEntry {
        string barangay;
        string vulnerabilitySignal;
        string immunityMechanism;
        string emotionalTag;
    }

    ImmunityEntry[] public ledger;

    event DigitalLiteracyImmunityTagged(string barangay, string vulnerabilitySignal, string immunityMechanism, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagImmunity(
        string memory barangay,
        string memory vulnerabilitySignal,
        string memory immunityMechanism,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(ImmunityEntry(barangay, vulnerabilitySignal, immunityMechanism, emotionalTag));
        emit DigitalLiteracyImmunityTagged(barangay, vulnerabilitySignal, immunityMechanism, emotionalTag);
    }
}
