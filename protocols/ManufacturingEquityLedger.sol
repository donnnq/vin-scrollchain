// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ManufacturingEquityLedger {
    address public steward;

    struct EquityEntry {
        string region;
        string manufacturingType;
        string equitySignal;
        string emotionalTag;
    }

    EquityEntry[] public ledger;

    event ManufacturingEquityTagged(string region, string manufacturingType, string equitySignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagEquity(
        string memory region,
        string memory manufacturingType,
        string memory equitySignal,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(EquityEntry(region, manufacturingType, equitySignal, emotionalTag));
        emit ManufacturingEquityTagged(region, manufacturingType, equitySignal, emotionalTag);
    }
}
