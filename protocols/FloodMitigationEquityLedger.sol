// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FloodMitigationEquityLedger {
    address public steward;

    struct EquityEntry {
        string region;
        string fundingLevel;
        string projectScope;
        string emotionalTag;
    }

    EquityEntry[] public ledger;

    event MitigationEquityTagged(string region, string fundingLevel, string projectScope, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagEquity(
        string memory region,
        string memory fundingLevel,
        string memory projectScope,
        string memory emotionalTag
    ) public onlySteard {
        ledger.push(EquityEntry(region, fundingLevel, projectScope, emotionalTag));
        emit MitigationEquityTagged(region, fundingLevel, projectScope, emotionalTag);
    }
}
