// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ThreatActorReputationLedger {
    address public steward;

    struct ActorEntry {
        string actorName; // "Budworm", "Sheathminer", "Storm-2603"
        string countryOrigin; // "China", "Russia", etc.
        string exploitUsed; // "ToolShell", "Zero-day", "RCE"
        string reputationStatus; // "Active", "Dormant", "Sanctioned"
        string emotionalTag;
        bool logged;
        bool sealed;
    }

    ActorEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function logActor(string memory actorName, string memory countryOrigin, string memory exploitUsed, string memory reputationStatus, string memory emotionalTag) external onlySteward {
        entries.push(ActorEntry(actorName, countryOrigin, exploitUsed, reputationStatus, emotionalTag, true, false));
    }

    function sealActorEntry(uint256 index) external onlySteward {
        require(entries[index].logged, "Must be logged first");
        entries[index].sealed = true;
    }

    function getActorEntry(uint256 index) external view returns (ActorEntry memory) {
        return entries[index];
    }
}
