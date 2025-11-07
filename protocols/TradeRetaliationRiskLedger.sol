// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TradeRetaliationRiskLedger {
    address public steward;

    struct RiskEntry {
        string originCountry;
        string targetCountry;
        string retaliationTrigger;
        string emotionalTag;
    }

    RiskEntry[] public ledger;

    event TradeRetaliationTagged(string originCountry, string targetCountry, string retaliationTrigger, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagRetaliation(
        string memory originCountry,
        string memory targetCountry,
        string memory retaliationTrigger,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(RiskEntry(originCountry, targetCountry, retaliationTrigger, emotionalTag));
        emit TradeRetaliationTagged(originCountry, targetCountry, retaliationTrigger, emotionalTag);
    }
}
