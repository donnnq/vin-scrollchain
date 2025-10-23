// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ZeroDayBroadcastIndex {
    address public steward;

    struct BroadcastEntry {
        string eventName; // "Pwn2Own 2025"
        uint256 zeroDayCount;
        uint256 totalBounty;
        string broadcastChannel; // "Cybersecurity bulletin", "Agency alert", "Public ledger"
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

    function broadcastZeroDay(string memory eventName, uint256 zeroDayCount, uint256 totalBounty, string memory broadcastChannel, string memory emotionalTag) external onlySteward {
        entries.push(BroadcastEntry(eventName, zeroDayCount, totalBounty, broadcastChannel, emotionalTag, true, false));
    }

    function sealBroadcastEntry(uint256 index) external onlySteward {
        require(entries[index].broadcasted, "Must be broadcasted first");
        entries[index].sealed = true;
    }

    function getBroadcastEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return entries[index];
    }
}
