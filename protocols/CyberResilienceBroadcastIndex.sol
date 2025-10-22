// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CyberResilienceBroadcastIndex {
    address public admin;

    struct BroadcastEntry {
        string resilienceSignal; // "Patch compliance achieved", "Zero-day contained", "Network hardened"
        string broadcastChannel; // "CISA bulletin", "Microsoft advisory", "Cybernews digest"
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

    function broadcastResilience(string memory resilienceSignal, string memory broadcastChannel, string memory emotionalTag) external onlyAdmin {
        entries.push(BroadcastEntry(resilienceSignal, broadcastChannel, emotionalTag, true, false));
    }

    function sealBroadcastEntry(uint256 index) external onlyAdmin {
        require(entries[index].broadcasted, "Must be broadcasted first");
        entries[index].sealed = true;
    }

    function getBroadcastEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return entries[index];
    }
}
