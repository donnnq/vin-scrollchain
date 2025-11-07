// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BilateralTradeKarmaTreaty {
    address public steward;

    struct KarmaEntry {
        string partnerCountry;
        string tradeAction;
        string karmicImpact;
        string emotionalTag;
    }

    KarmaEntry[] public treaty;

    event TradeKarmaTagged(string partnerCountry, string tradeAction, string karmicImpact, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagTradeKarma(
        string memory partnerCountry,
        string memory tradeAction,
        string memory karmicImpact,
        string memory emotionalTag
    ) public onlySteward {
        treaty.push(KarmaEntry(partnerCountry, tradeAction, karmicImpact, emotionalTag));
        emit TradeKarmaTagged(partnerCountry, tradeAction, karmicImpact, emotionalTag);
    }
}
