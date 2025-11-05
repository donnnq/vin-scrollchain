// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MaduroWartimeAlertImmunityLedger {
    address public steward;

    struct ImmunityEntry {
        string declarationDate;
        string alertSignal;
        string immunityMechanism;
        string emotionalTag;
    }

    ImmunityEntry[] public ledger;

    event WartimeAlertImmunityTagged(string declarationDate, string alertSignal, string immunityMechanism, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagImmunity(
        string memory declarationDate,
        string memory alertSignal,
        string memory immunityMechanism,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(ImmunityEntry(declarationDate, alertSignal, immunityMechanism, emotionalTag));
        emit WartimeAlertImmunityTagged(declarationDate, alertSignal, immunityMechanism, emotionalTag);
    }
}
