// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TestimonyToUNBroadcastGrid {
    address public steward;

    struct BroadcastEntry {
        string testimonySource; // "Nigeria"
        string message; // "Please America help stop killing Christians in Nigeria"
        string broadcastChannel; // "UN Human Rights Council, global media, scrollchain"
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

    function broadcastTestimony(string memory testimonySource, string memory message, string memory broadcastChannel, string memory emotionalTag) external onlySteward {
        entries.push(BroadcastEntry(testimonySource, message, broadcastChannel, emotionalTag, true, false));
    }

    function sealBroadcastEntry(uint256 index) external onlySteward {
        require(entries[index].broadcasted, "Must be broadcasted first");
        entries[index].sealed = true;
    }

    function getBroadcastEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return entries[index];
    }
}
