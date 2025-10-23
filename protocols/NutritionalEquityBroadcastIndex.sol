// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NutritionalEquityBroadcastIndex {
    address public steward;

    struct BroadcastEntry {
        string messageType; // "Feeding activation", "Price justice", "Nutrition rights"
        string broadcastChannel; // "Barangay bulletin", "Radio", "Facebook Live"
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

    function broadcastMessage(string memory messageType, string memory broadcastChannel, string memory emotionalTag) external onlySteard {
        entries.push(BroadcastEntry(messageType, broadcastChannel, emotionalTag, true, false));
    }

    function sealBroadcastEntry(uint256 index) external onlySteward {
        require(entries[index].broadcasted, "Must be broadcasted first");
        entries[index].sealed = true;
    }

    function getBroadcastEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return entries[index];
    }
}
