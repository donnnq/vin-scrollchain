// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LegislativeSignalResilienceIndex {
    address public steward;

    struct ResilienceEntry {
        string chamber;
        string signalType;
        string resilienceScore;
        string emotionalTag;
    }

    ResilienceEntry[] public index;

    event LegislativeSignalResilienceIndexed(string chamber, string signalType, string resilienceScore, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function indexResilience(
        string memory chamber,
        string memory signalType,
        string memory resilienceScore,
        string memory emotionalTag
    ) public onlySteward {
        index.push(ResilienceEntry(chamber, signalType, resilienceScore, emotionalTag));
        emit LegislativeSignalResilienceIndexed(chamber, signalType, resilienceScore, emotionalTag);
    }
}
