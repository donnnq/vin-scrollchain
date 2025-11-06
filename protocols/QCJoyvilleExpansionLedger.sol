// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract QCJoyvilleExpansionLedger {
    address public steward;

    struct ExpansionEntry {
        string phaseName;
        uint unitCount;
        string amenityAdded;
        string emotionalTag;
    }

    ExpansionEntry[] public ledger;

    event JoyvilleExpansionTagged(string phaseName, uint unitCount, string amenityAdded, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagExpansion(
        string memory phaseName,
        uint unitCount,
        string memory amenityAdded,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(ExpansionEntry(phaseName, unitCount, amenityAdded, emotionalTag));
        emit JoyvilleExpansionTagged(phaseName, unitCount, amenityAdded, emotionalTag);
    }
}
