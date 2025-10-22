// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract JudicialConsequenceBroadcastGrid {
    address public admin;

    struct BroadcastEntry {
        string caseType; // "Infrastructure corruption", "Procurement fraud", "Contractor collusion"
        string consequenceSignal; // "Prosecution filed", "Assets frozen", "Blacklist enforced"
        string broadcastChannel; // "Senate report", "DOJ bulletin", "Public digest"
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

    function broadcastConsequence(string memory caseType, string memory consequenceSignal, string memory broadcastChannel, string memory emotionalTag) external onlyAdmin {
        entries.push(BroadcastEntry(caseType, consequenceSignal, broadcastChannel, emotionalTag, true, false));
    }

    function sealBroadcastEntry(uint256 index) external onlyAdmin {
        require(entries[index].broadcasted, "Must be broadcasted first");
        entries[index].sealed = true;
    }

    function getBroadcastEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return entries[index];
    }
}
