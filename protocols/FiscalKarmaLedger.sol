// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FiscalKarmaLedger {
    address public steward;

    struct KarmaEntry {
        string agency;
        string budgetSignal;
        string karmaScore;
        string emotionalTag;
    }

    KarmaEntry[] public ledger;

    event FiscalKarmaTagged(string agency, string budgetSignal, string karmaScore, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagKarma(
        string memory agency,
        string memory budgetSignal,
        string memory karmaScore,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(KarmaEntry(agency, budgetSignal, karmaScore, emotionalTag));
        emit FiscalKarmaTagged(agency, budgetSignal, karmaScore, emotionalTag);
    }
}
