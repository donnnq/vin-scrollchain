// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FilibusterImpactAuditLedger {
    address public steward;

    struct FilibusterEntry {
        string year;
        string usageContext;
        string partisanEffect;
        string emotionalTag;
    }

    FilibusterEntry[] public ledger;

    event FilibusterImpactTagged(string year, string usageContext, string partisanEffect, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagFilibusterImpact(
        string memory year,
        string memory usageContext,
        string memory partisanEffect,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(FilibusterEntry(year, usageContext, partisanEffect, emotionalTag));
        emit FilibusterImpactTagged(year, usageContext, partisanEffect, emotionalTag);
    }
}
