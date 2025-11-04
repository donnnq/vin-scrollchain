// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GhostProjectOversightDAO {
    address public steward;

    struct OversightEntry {
        string projectReference;
        string oversightSignal;
        string governanceMechanism;
        string emotionalTag;
    }

    OversightEntry[] public registry;

    event GhostOversightTagged(string projectReference, string oversightSignal, string governanceMechanism, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagOversight(
        string memory projectReference,
        string memory oversightSignal,
        string memory governanceMechanism,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(OversightEntry(projectReference, oversightSignal, governanceMechanism, emotionalTag));
        emit GhostOversightTagged(projectReference, oversightSignal, governanceMechanism, emotionalTag);
    }
}
