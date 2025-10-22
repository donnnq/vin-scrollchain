// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SenateTransparencyBroadcastGrid_Live {
    address public admin;

    struct BroadcastEntry {
        string committeeCluster; // "Justice and Human Rights + Civil Service + Finance"
        string transparencySignal; // "Live hearing", "Public engagement", "Multi-agency oversight"
        string broadcastChannel; // "YouTube livestream", "Senate website", "Public digest"
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

    function broadcastTransparency(string memory committeeCluster, string memory transparencySignal, string memory broadcastChannel, string memory emotionalTag) external onlyAdmin {
        entries.push(BroadcastEntry(committeeCluster, transparencySignal, broadcastChannel, emotionalTag, true, false));
    }

    function sealBroadcastEntry(uint256 index) external onlyAdmin {
        require(entries[index].broadcasted, "Must be broadcasted first");
        entries[index].sealed = true;
    }

    function getBroadcastEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return entries[index];
    }
}
