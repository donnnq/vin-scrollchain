// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CitizenOversightBroadcastProtocol {
    address public admin;

    struct BroadcastEntry {
        string oversightMethod; // "Public hearings", "Online dashboards", "Community audits"
        string broadcastChannel; // "Senate livestream", "GMA News", "Citizen portal"
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

    function broadcastOversight(string memory oversightMethod, string memory broadcastChannel, string memory emotionalTag) external onlyAdmin {
        entries.push(BroadcastEntry(oversightMethod, broadcastChannel, emotionalTag, true, false));
    }

    function sealBroadcastEntry(uint256 index) external onlyAdmin {
        require(entries[index].broadcasted, "Must be broadcasted first");
        entries[index].sealed = true;
    }

    function getBroadcastEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return entries[index];
    }
}
