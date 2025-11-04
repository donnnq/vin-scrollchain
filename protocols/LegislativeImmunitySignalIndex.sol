// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LegislativeImmunitySignalIndex {
    address public steward;

    struct SignalEntry {
        string legislator;
        string immunitySignal;
        string classification;
        string emotionalTag;
    }

    SignalEntry[] public index;

    event LegislativeImmunityIndexed(string legislator, string immunitySignal, string classification, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function indexImmunity(
        string memory legislator,
        string memory immunitySignal,
        string memory classification,
        string memory emotionalTag
    ) public onlySteward {
        index.push(SignalEntry(legislator, immunitySignal, classification, emotionalTag));
        emit LegislativeImmunityIndexed(legislator, immunitySignal, classification, emotionalTag);
    }
}
