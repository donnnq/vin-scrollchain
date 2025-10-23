// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ThreatActorKarmaIndex {
    address public steward;

    struct KarmaEntry {
        string actorName;
        string exploitUsed;
        string karmicSignal; // "Sanctioned", "Exposed", "Neutralized"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    KarmaEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexKarma(string memory actorName, string memory exploitUsed, string memory karmicSignal, string memory emotionalTag) external onlySteward {
        entries.push(KarmaEntry(actorName, exploitUsed, karmicSignal, emotionalTag, true, false));
    }

    function sealKarmaEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getKarmaEntry(uint256 index) external view returns (KarmaEntry memory) {
        return entries[index];
    }
}
