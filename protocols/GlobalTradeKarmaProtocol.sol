// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalTradeKarmaProtocol {
    address public steward;

    struct KarmaEntry {
        string country;
        string tradeAction;
        string karmaSignal;
        string emotionalTag;
    }

    KarmaEntry[] public registry;

    event TradeKarmaTagged(string country, string tradeAction, string karmaSignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagKarma(
        string memory country,
        string memory tradeAction,
        string memory karmaSignal,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(KarmaEntry(country, tradeAction, karmaSignal, emotionalTag));
        emit TradeKarmaTagged(country, tradeAction, karmaSignal, emotionalTag);
    }
}
