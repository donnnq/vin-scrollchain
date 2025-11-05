// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CostOfLivingEquityLedger {
    address public steward;

    struct EquityEntry {
        string region;
        string expenseCategory;
        string equityProtocol;
        string emotionalTag;
    }

    EquityEntry[] public ledger;

    event CostOfLivingEquityTagged(string region, string expenseCategory, string equityProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagEquity(
        string memory region,
        string memory expenseCategory,
        string memory equityProtocol,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(EquityEntry(region, expenseCategory, equityProtocol, emotionalTag));
        emit CostOfLivingEquityTagged(region, expenseCategory, equityProtocol, emotionalTag);
    }
}
