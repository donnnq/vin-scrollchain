// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ContrarianSignalRegistry {
    address public steward;

    struct Signal {
        string asset;
        string signalType;
        string timestamp;
        string rationale;
        string emotionalTag;
    }

    Signal[] public registry;

    event ContrarianSignalLogged(string asset, string signalType, string timestamp, string rationale, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logSignal(
        string memory asset,
        string memory signalType,
        string memory timestamp,
        string memory rationale,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(Signal(asset, signalType, timestamp, rationale, emotionalTag));
        emit ContrarianSignalLogged(asset, signalType, timestamp, rationale, emotionalTag);
    }
}
