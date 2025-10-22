// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GovernanceIntegrityBroadcastGrid {
    address public admin;

    struct BroadcastEntry {
        string incident; // "Senate Bill No. 1215 debate"
        string broadcastChannel; // "News", "Public forum", "Legislative digest"
        string integritySignal; // "Ombudsman defense", "COA reinforcement", "Redundancy audit"
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

    function broadcastIntegrity(string memory incident, string memory broadcastChannel, string memory integritySignal, string memory emotionalTag) external onlyAdmin {
        entries.push(BroadcastEntry(incident, broadcastChannel, integritySignal, emotionalTag, true, false));
    }

    function sealBroadcastEntry(uint256 index) external onlyAdmin {
        require(entries[index].broadcasted, "Must be broadcasted first");
        entries[index].sealed = true;
    }

    function getBroadcastEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return entries[index];
    }
}
