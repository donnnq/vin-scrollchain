// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ThreatActorToPlanetaryKarmaBroadcast {
    address public steward;

    struct BroadcastEntry {
        string actorName;
        string exploitUsed;
        string karmicOutcome; // "Sanctioned", "Exposed", "Neutralized"
        string broadcastMedium; // "UN alert", "Cybersecurity treaty", "Planetary ledger"
        string emotionalTag;
        bool broadcasted;
        bool sealed;
    }

    BroadcastEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function broadcastKarma(string memory actorName, string memory exploitUsed, string memory karmicOutcome, string memory broadcastMedium, string memory emotionalTag) external onlySteward {
        entries.push(BroadcastEntry(actorName, exploitUsed, karmicOutcome, broadcastMedium, emotionalTag, true, false));
    }

    function sealBroadcastEntry(uint256 index) external onlySteward {
        require(entries[index].broadcasted, "Must be broadcasted first");
        entries[index].sealed = true;
    }

    function getBroadcastEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return entries[index];
    }
}
