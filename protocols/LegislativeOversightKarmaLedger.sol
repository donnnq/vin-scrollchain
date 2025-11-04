// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LegislativeOversightKarmaLedger {
    address public steward;

    struct KarmaEntry {
        string legislator;
        string oversightDomain;
        string karmaSignal;
        string emotionalTag;
    }

    KarmaEntry[] public ledger;

    event OversightKarmaTagged(string legislator, string oversightDomain, string karmaSignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagKarma(
        string memory legislator,
        string memory oversightDomain,
        string memory karmaSignal,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(KarmaEntry(legislator, oversightDomain, karmaSignal, emotionalTag));
        emit OversightKarmaTagged(legislator, oversightDomain, karmaSignal, emotionalTag);
    }
}
