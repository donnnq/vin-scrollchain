// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CivicRitualCodex {
    address public steward;

    struct RitualEntry {
        string eventName;
        string infrastructureSupport;
        string civicOutcome;
        string emotionalTag;
    }

    RitualEntry[] public codex;

    event CivicRitualLogged(string eventName, string infrastructureSupport, string civicOutcome, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logRitual(
        string memory eventName,
        string memory infrastructureSupport,
        string memory civicOutcome,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(RitualEntry(eventName, infrastructureSupport, civicOutcome, emotionalTag));
        emit CivicRitualLogged(eventName, infrastructureSupport, civicOutcome, emotionalTag);
    }
}
