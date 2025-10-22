// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TransparencyRitualBroadcastIndex {
    address public admin;

    struct BroadcastEntry {
        string ritualType; // "Livestream hearings", "Audit log publication", "Public engagement"
        string broadcastChannel; // "Senate website", "YouTube", "Public digest"
        string emotionalTag;
        bool broadcasted;
        bool sealed;
    }

    BroadcastEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function broadcastRitual(string memory ritualType, string memory broadcastChannel, string memory emotionalTag) external onlyAdmin {
        entries.push(BroadcastEntry(ritualType, broadcastChannel, emotionalTag, true, false));
    }

    function sealBroadcastEntry(uint256 index) external onlyAdmin {
        require(entries[index].broadcasted, "Must be broadcasted first");
        entries[index].sealed = true;
    }

    function getBroadcastEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return entries[index];
    }
}
