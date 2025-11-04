// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FloodControlTestimonyLedger {
    address public steward;

    struct TestimonyEntry {
        string witnessName;
        string projectReference;
        string testimonySummary;
        string emotionalTag;
    }

    TestimonyEntry[] public ledger;

    event FloodTestimonyTagged(string witnessName, string projectReference, string testimonySummary, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagTestimony(
        string memory witnessName,
        string memory projectReference,
        string memory testimonySummary,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(TestimonyEntry(witnessName, projectReference, testimonySummary, emotionalTag));
        emit FloodTestimonyTagged(witnessName, projectReference, testimonySummary, emotionalTag);
    }
}
