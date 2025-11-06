// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicTransitEquityLedger {
    address public steward;

    struct TransitEntry {
        string city;
        string transitMode;
        string equityScore;
        string emotionalTag;
    }

    TransitEntry[] public ledger;

    event TransitEquityTagged(string city, string transitMode, string equityScore, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagTransitEquity(
        string memory city,
        string memory transitMode,
        string memory equityScore,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(TransitEntry(city, transitMode, equityScore, emotionalTag));
        emit TransitEquityTagged(city, transitMode, equityScore, emotionalTag);
    }
}
