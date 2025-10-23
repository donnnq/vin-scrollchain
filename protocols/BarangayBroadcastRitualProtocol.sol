// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayBroadcastRitualProtocol {
    address public steward;

    struct BroadcastEntry {
        string barangayName;
        string broadcastType; // "Housing equity", "Livelihood onboarding", "Teen showcase"
        string channel; // "Radio", "Community bulletin", "Facebook Live"
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

    function broadcastMessage(string memory barangayName, string memory broadcastType, string memory channel, string memory emotionalTag) external onlySteward {
        entries.push(BroadcastEntry(barangayName, broadcastType, channel, emotionalTag, true, false));
    }

    function sealBroadcastEntry(uint256 index) external onlySteward {
        require(entries[index].broadcasted, "Must be broadcasted first");
        entries[index].sealed = true;
    }

    function getBroadcastEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return entries[index];
    }
}
