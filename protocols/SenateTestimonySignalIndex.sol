// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SenateTestimonySignalIndex {
    address public steward;

    struct SignalEntry {
        string witnessName;
        string hearingTitle;
        string signalType;
        string emotionalTag;
    }

    SignalEntry[] public index;

    event TestimonySignalIndexed(string witnessName, string hearingTitle, string signalType, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function indexSignal(
        string memory witnessName,
        string memory hearingTitle,
        string memory signalType,
        string memory emotionalTag
    ) public onlySteward {
        index.push(SignalEntry(witnessName, hearingTitle, signalType, emotionalTag));
        emit TestimonySignalIndexed(witnessName, hearingTitle, signalType, emotionalTag);
    }
}
