// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicNarrativeForensicsDAO {
    address public steward;

    struct ForensicEntry {
        string mediaSource;
        string narrativeSignal;
        string forensicProtocol;
        string emotionalTag;
    }

    ForensicEntry[] public registry;

    event NarrativeForensicsTagged(string mediaSource, string narrativeSignal, string forensicProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagNarrative(
        string memory mediaSource,
        string memory narrativeSignal,
        string memory forensicProtocol,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(ForensicEntry(mediaSource, narrativeSignal, forensicProtocol, emotionalTag));
        emit NarrativeForensicsTagged(mediaSource, narrativeSignal, forensicProtocol, emotionalTag);
    }
}
