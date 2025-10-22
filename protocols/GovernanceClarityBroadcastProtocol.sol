// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GovernanceClarityBroadcastProtocol {
    address public admin;

    struct BroadcastEntry {
        string incident; // "SB No. 1215 debate"
        string claritySignal; // "Ombudsman mandate", "COA jurisdiction", "Redundancy objection"
        string broadcastChannel; // "Senate hearing", "Public digest", "News outlet"
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

    function broadcastClarity(string memory incident, string memory claritySignal, string memory broadcastChannel, string memory emotionalTag) external onlyAdmin {
        entries.push(BroadcastEntry(incident, claritySignal, broadcastChannel, emotionalTag, true, false));
    }

    function sealBroadcastEntry(uint256 index) external onlyAdmin {
        require(entries[index].broadcasted, "Must be broadcasted first");
        entries[index].sealed = true;
    }

    function getBroadcastEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return entries[index];
    }
}
