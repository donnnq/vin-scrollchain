// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AntiCorruptionOversightBroadcastGrid {
    address public admin;

    struct BroadcastEntry {
        string incident; // "Senate Bill No. 1215 debate"
        string broadcastChannel; // "Senate hearing", "News", "Public forum"
        string oversightSignal; // "Drilon objection", "Ombudsman strengthening", "COA reinforcement"
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

    function broadcastOversight(string memory incident, string memory broadcastChannel, string memory oversightSignal, string memory emotionalTag) external onlyAdmin {
        entries.push(BroadcastEntry(incident, broadcastChannel, oversightSignal, emotionalTag, true, false));
    }

    function sealBroadcastEntry(uint256 index) external onlyAdmin {
        require(entries[index].broadcasted, "Must be broadcasted first");
        entries[index].sealed = true;
    }

    function getBroadcastEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return entries[index];
    }
}
