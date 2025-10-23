// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DOJTransparencyBroadcastIndex {
    address public steward;

    struct BroadcastEntry {
        string caseName;
        string involvedParties;
        string broadcastChannel; // "Public ledger", "Press release", "Live hearing"
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

    function broadcastCase(string memory caseName, string memory involvedParties, string memory broadcastChannel, string memory emotionalTag) external onlySteward {
        entries.push(BroadcastEntry(caseName, involvedParties, broadcastChannel, emotionalTag, true, false));
    }

    function sealBroadcastEntry(uint256 index) external onlySteward {
        require(entries[index].broadcasted, "Must be broadcasted first");
        entries[index].sealed = true;
    }

    function getBroadcastEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return entries[index];
    }
}
