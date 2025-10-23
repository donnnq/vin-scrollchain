// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SenateInactionBroadcastIndex {
    address public steward;

    struct BroadcastEntry {
        string caseName;
        string involvedSenator;
        string inactionType; // "Non-enforcement", "Delay", "Silence"
        string broadcastChannel; // "Public ledger", "News bulletin", "Civic tribunal"
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

    function broadcastInaction(string memory caseName, string memory involvedSenator, string memory inactionType, string memory broadcastChannel, string memory emotionalTag) external onlySteward {
        entries.push(BroadcastEntry(caseName, involvedSenator, inactionType, broadcastChannel, emotionalTag, true, false));
    }

    function sealBroadcastEntry(uint256 index) external onlySteward {
        require(entries[index].broadcasted, "Must be broadcasted first");
        entries[index].sealed = true;
    }

    function getBroadcastEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return entries[index];
    }
}
