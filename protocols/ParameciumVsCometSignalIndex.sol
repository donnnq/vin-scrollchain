// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ParameciumVsCometSignalIndex {
    address public steward;

    struct SignalEntry {
        string contentReference;
        string signalType;
        string classification;
        string emotionalTag;
    }

    SignalEntry[] public index;

    event SignalIndexed(string contentReference, string signalType, string classification, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function indexSignal(
        string memory contentReference,
        string memory signalType,
        string memory classification,
        string memory emotionalTag
    ) public onlySteward {
        index.push(SignalEntry(contentReference, signalType, classification, emotionalTag));
        emit SignalIndexed(contentReference, signalType, classification, emotionalTag);
    }
}
