// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StrategicAllyTradeLedger {
    address public steward;

    struct TradeEntry {
        string allyCountry;
        string benefitType;
        string cooperationBasis;
        string emotionalTag;
    }

    TradeEntry[] public ledger;

    event StrategicTradeTagged(string allyCountry, string benefitType, string cooperationBasis, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagTradeBenefit(
        string memory allyCountry,
        string memory benefitType,
        string memory cooperationBasis,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(TradeEntry(allyCountry, benefitType, cooperationBasis, emotionalTag));
        emit StrategicTradeTagged(allyCountry, benefitType, cooperationBasis, emotionalTag);
    }
}
