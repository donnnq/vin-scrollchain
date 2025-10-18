// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GazaRantBroadcastProtocol {
    address public admin;

    struct RantEntry {
        string protesterName;
        string message;
        string emotionalTag;
        bool summoned;
        bool broadcasted;
    }

    RantEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonRant(string memory protesterName, string memory message, string memory emotionalTag) external onlyAdmin {
        entries.push(RantEntry(protesterName, message, emotionalTag, true, false));
    }

    function broadcastRant(uint256 index) external onlyAdmin {
        entries[index].broadcasted = true;
    }

    function getRantEntry(uint256 index) external view returns (RantEntry memory) {
        return entries[index];
    }
}
