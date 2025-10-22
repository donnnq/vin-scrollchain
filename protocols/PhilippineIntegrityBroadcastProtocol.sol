// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PhilippineIntegrityBroadcastProtocol {
    address public admin;

    struct BroadcastEntry {
        string agency; // "DPWH", "BOC", "BIR", "DOF", "GSIS"
        string integritySignal; // "Transparency ritual", "Audit compliance", "Public engagement"
        string broadcastChannel; // "Senate livestream", "News outlet", "Public digest"
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

    function broadcastIntegrity(string memory agency, string memory integritySignal, string memory broadcastChannel, string memory emotionalTag) external onlyAdmin {
        entries.push(BroadcastEntry(agency, integritySignal, broadcastChannel, emotionalTag, true, false));
    }

    function sealBroadcastEntry(uint256 index) external onlyAdmin {
        require(entries[index].broadcasted, "Must be broadcasted first");
        entries[index].sealed = true;
    }

    function getBroadcastEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return entries[index];
    }
}
