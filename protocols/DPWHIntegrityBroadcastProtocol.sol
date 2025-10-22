// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DPWHIntegrityBroadcastProtocol {
    address public admin;

    struct BroadcastEntry {
        string incident; // "DPWH fire"
        string broadcastChannel; // "News", "Social media", "Public forum"
        string integritySignal; // "Evidence recovery", "Anti-corruption stance"
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
