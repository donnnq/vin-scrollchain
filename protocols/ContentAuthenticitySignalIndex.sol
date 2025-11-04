// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ContentAuthenticitySignalIndex {
    address public steward;

    struct SignalEntry {
        string contentReference;
        string authenticitySignal;
        string classification;
        string emotionalTag;
    }

    SignalEntry[] public index;

    event ContentAuthenticityIndexed(string contentReference, string authenticitySignal, string classification, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function indexAuthenticity(
        string memory contentReference,
        string memory authenticitySignal,
        string memory classification,
        string memory emotionalTag
    ) public onlySteward {
        index.push(SignalEntry(contentReference, authenticitySignal, classification, emotionalTag));
        emit ContentAuthenticityIndexed(contentReference, authenticitySignal, classification, emotionalTag);
    }
}
