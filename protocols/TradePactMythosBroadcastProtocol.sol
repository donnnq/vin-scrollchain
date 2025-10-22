// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TradePactMythosBroadcastProtocol {
    address public admin;

    struct BroadcastEntry {
        string treatyName; // "Philippines–EU FTA"
        string broadcastPlatform; // "News", "YouTube", "Gov press release"
        string mythosSignal; // "Economic resilience", "Strategic sovereignty"
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

    function broadcastMythos(string memory treatyName, string memory broadcastPlatform, string memory mythosSignal, string memory emotionalTag) external onlyAdmin {
        entries.push(BroadcastEntry(treatyName, broadcastPlatform, mythosSignal, emotionalTag, true, false));
    }

    function sealBroadcastEntry(uint256 index) external onlyAdmin {
        require(entries[index].broadcasted, "Must be broadcasted first");
        entries[index].sealed = true;
    }

    function getBroadcastEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return entries[index];
    }
}
