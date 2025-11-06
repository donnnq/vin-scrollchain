// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DiplomaticReEntryLedger {
    address public steward;

    struct ReEntryClause {
        string nation;
        string reEntryContext;
        string protocolType;
        string emotionalTag;
    }

    ReEntryClause[] public ledger;

    event DiplomaticReEntryTagged(string nation, string reEntryContext, string protocolType, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagReEntry(
        string memory nation,
        string memory reEntryContext,
        string memory protocolType,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(ReEntryClause(nation, reEntryContext, protocolType, emotionalTag));
        emit DiplomaticReEntryTagged(nation, reEntryContext, protocolType, emotionalTag);
    }
}
