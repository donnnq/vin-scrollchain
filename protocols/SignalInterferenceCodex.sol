// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SignalInterferenceCodex {
    address public steward;

    struct InterferenceEntry {
        string signalType;
        string interferenceSource;
        string containmentAction;
        string emotionalTag;
    }

    InterferenceEntry[] public codex;

    event SignalInterferenceLogged(string signalType, string interferenceSource, string containmentAction, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logInterference(
        string memory signalType,
        string memory interferenceSource,
        string memory containmentAction,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(InterferenceEntry(signalType, interferenceSource, containmentAction, emotionalTag));
        emit SignalInterferenceLogged(signalType, interferenceSource, containmentAction, emotionalTag);
    }
}
