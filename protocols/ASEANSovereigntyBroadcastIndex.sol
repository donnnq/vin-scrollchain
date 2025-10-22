// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ASEANSovereigntyBroadcastIndex {
    address public admin;

    struct BroadcastEntry {
        string memberCountry; // "Philippines", "Vietnam", "Singapore"
        string broadcastPlatform; // "News", "YouTube", "Gov press release"
        string sovereigntySignal; // "Trade independence", "FTA leverage", "Tariff resistance"
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

    function broadcastSovereignty(string memory memberCountry, string memory broadcastPlatform, string memory sovereigntySignal, string memory emotionalTag) external onlyAdmin {
        entries.push(BroadcastEntry(memberCountry, broadcastPlatform, sovereigntySignal, emotionalTag, true, false));
    }

    function sealBroadcastEntry(uint256 index) external onlyAdmin {
        require(entries[index].broadcasted, "Must be broadcasted first");
        entries[index].sealed = true;
    }

    function getBroadcastEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return entries[index];
    }
}
