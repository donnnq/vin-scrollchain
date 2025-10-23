// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NewLifeBroadcastGrid {
    address public steward;

    struct BroadcastEntry {
        string messageType; // "Housing opportunity", "Livelihood onboarding", "Remote work access"
        string broadcastSignal; // "Radio PSA", "Community bulletin", "Livestream comment"
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

    function broadcastMessage(string memory messageType, string memory broadcastSignal, string memory emotionalTag) external onlySteward {
        entries.push(BroadcastEntry(messageType, broadcastSignal, emotionalTag, true, false));
    }

    function sealBroadcastEntry(uint256 index) external onlySteward {
        require(entries[index].broadcasted, "Must be broadcasted first");
        entries[index].sealed = true;
    }

    function getBroadcastEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return entries[index];
    }
}
