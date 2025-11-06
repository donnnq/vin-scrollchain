// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TaxBurdenKarmaLedger {
    address public steward;

    struct TaxEntry {
        string stateName;
        string taxType;
        string burdenLevel;
        string emotionalTag;
    }

    TaxEntry[] public ledger;

    event TaxBurdenTagged(string stateName, string taxType, string burdenLevel, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagTaxBurden(
        string memory stateName,
        string memory taxType,
        string memory burdenLevel,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(TaxEntry(stateName, taxType, burdenLevel, emotionalTag));
        emit TaxBurdenTagged(stateName, taxType, burdenLevel, emotionalTag);
    }
}
