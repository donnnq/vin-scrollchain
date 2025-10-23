// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ThreatActorSanctionBroadcastGrid {
    address public steward;

    struct SanctionEntry {
        string actorName; // "Budworm", "Sheathminer", "Storm-2603"
        string sanctionType; // "Blacklist", "Asset freeze", "Diplomatic alert"
        string broadcastChannel; // "Cybersecurity bulletin", "Public ledger", "International alert"
        string emotionalTag;
        bool broadcasted;
        bool sealed;
    }

    SanctionEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function broadcastSanction(string memory actorName, string memory sanctionType, string memory broadcastChannel, string memory emotionalTag) external onlySteward {
        entries.push(SanctionEntry(actorName, sanctionType, broadcastChannel, emotionalTag, true, false));
    }

    function sealSanctionEntry(uint256 index) external onlySteward {
        require(entries[index].broadcasted, "Must be broadcasted first");
        entries[index].sealed = true;
    }

    function getSanctionEntry(uint256 index) external view returns (SanctionEntry memory) {
        return entries[index];
    }
}
