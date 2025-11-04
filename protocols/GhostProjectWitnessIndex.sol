// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GhostProjectWitnessIndex {
    address public steward;

    struct WitnessEntry {
        string witnessName;
        string projectReference;
        string testimonySignal;
        string emotionalTag;
    }

    WitnessEntry[] public index;

    event GhostProjectWitnessIndexed(string witnessName, string projectReference, string testimonySignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function indexWitness(
        string memory witnessName,
        string memory projectReference,
        string memory testimonySignal,
        string memory emotionalTag
    ) public onlySteward {
        index.push(WitnessEntry(witnessName, projectReference, testimonySignal, emotionalTag));
        emit GhostProjectWitnessIndexed(witnessName, projectReference, testimonySignal, emotionalTag);
    }
}
