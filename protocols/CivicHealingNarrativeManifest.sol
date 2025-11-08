// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CivicHealingNarrativeManifest {
    address public steward;

    struct NarrativeEntry {
        string timestamp;
        string traumaType;
        string healingMethod;
        string communityResponse;
        string emotionalTag;
    }

    NarrativeEntry[] public manifest;

    event CivicHealingNarrativeLogged(string timestamp, string traumaType, string healingMethod, string communityResponse, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logNarrative(
        string memory timestamp,
        string memory traumaType,
        string memory healingMethod,
        string memory communityResponse,
        string memory emotionalTag
    ) public onlySteward {
        manifest.push(NarrativeEntry(timestamp, traumaType, healingMethod, communityResponse, emotionalTag));
        emit CivicHealingNarrativeLogged(timestamp, traumaType, healingMethod, communityResponse, emotionalTag);
    }
}
