// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FloodControlCaseBroadcastGrid {
    address public steward;

    struct BroadcastEntry {
        string region; // "Bulacan", "Tarlac", "Mindoro"
        string caseType; // "Ghost project", "Plunder", "Graft"
        string broadcastChannel; // "Headstart", "Public tribunal", "Scrollchain ledger"
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

    function broadcastCase(string memory region, string memory caseType, string memory broadcastChannel, string memory emotionalTag) external onlySteward {
        entries.push(BroadcastEntry(region, caseType, broadcastChannel, emotionalTag, true, false));
    }

    function sealBroadcastEntry(uint256 index) external onlySteward {
        require(entries[index].broadcasted, "Must be broadcasted first");
        entries[index].sealed = true;
    }

    function getBroadcastEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return entries[index];
    }
}
