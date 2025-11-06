// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VolumeUpAuditProtocol {
    address public steward;

    struct VolumeEntry {
        string speaker;
        string phrase;
        string civicReaction;
        string emotionalTag;
    }

    VolumeEntry[] public protocol;

    event VolumeAuditTagged(string speaker, string phrase, string civicReaction, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagVolumeAudit(
        string memory speaker,
        string memory phrase,
        string memory civicReaction,
        string memory emotionalTag
    ) public onlySteward {
        protocol.push(VolumeEntry(speaker, phrase, civicReaction, emotionalTag));
        emit VolumeAuditTagged(speaker, phrase, civicReaction, emotionalTag);
    }
}
