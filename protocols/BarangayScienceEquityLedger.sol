// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayScienceEquityLedger {
    address public steward;

    struct EquityEntry {
        string barangay;
        string scienceDomain;
        string equitySignal;
        string emotionalTag;
    }

    EquityEntry[] public ledger;

    event ScienceEquityTagged(string barangay, string scienceDomain, string equitySignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagEquity(
        string memory barangay,
        string memory scienceDomain,
        string memory equitySignal,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(EquityEntry(barangay, scienceDomain, equitySignal, emotionalTag));
        emit ScienceEquityTagged(barangay, scienceDomain, equitySignal, emotionalTag);
    }
}
