// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MarketResilienceKarmaLedger {
    address public steward;

    struct KarmaEntry {
        string marketName;
        string resilienceSignal;
        string karmaProtocol;
        string emotionalTag;
    }

    KarmaEntry[] public ledger;

    event MarketResilienceKarmaTagged(string marketName, string resilienceSignal, string karmaProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagKarma(
        string memory marketName,
        string memory resilienceSignal,
        string memory karmaProtocol,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(KarmaEntry(marketName, resilienceSignal, karmaProtocol, emotionalTag));
        emit MarketResilienceKarmaTagged(marketName, resilienceSignal, karmaProtocol, emotionalTag);
    }
}
