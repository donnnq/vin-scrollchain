// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SenateBlueRibbonSignalCodex {
    address public steward;

    struct SignalEntry {
        string hearingTitle;
        string committee;
        string signalType;
        string emotionalTag;
    }

    SignalEntry[] public codex;

    event BlueRibbonSignalTagged(string hearingTitle, string committee, string signalType, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagSignal(
        string memory hearingTitle,
        string memory committee,
        string memory signalType,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(SignalEntry(hearingTitle, committee, signalType, emotionalTag));
        emit BlueRibbonSignalTagged(hearingTitle, committee, signalType, emotionalTag);
    }
}
