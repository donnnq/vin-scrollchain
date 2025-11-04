// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PressBriefingSignalLedger {
    address public steward;

    struct SignalEntry {
        string briefingTitle;
        string speaker;
        string signalType;
        string emotionalTag;
    }

    SignalEntry[] public ledger;

    event PressBriefingSignalTagged(string briefingTitle, string speaker, string signalType, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagSignal(
        string memory briefingTitle,
        string memory speaker,
        string memory signalType,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(SignalEntry(briefingTitle, speaker, signalType, emotionalTag));
        emit PressBriefingSignalTagged(briefingTitle, speaker, signalType, emotionalTag);
    }
}
