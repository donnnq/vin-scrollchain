// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CannabisReformBroadcastGrid {
    address public admin;

    struct BroadcastEntry {
        string campaignName; // "Smart & Safe Florida"
        string platform; // "Podcast", "News", "Social media"
        string reformSignal; // "Voter suppression", "Economic opportunity", "Legal sovereignty"
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

    function broadcastReform(string memory campaignName, string memory platform, string memory reformSignal, string memory emotionalTag) external onlyAdmin {
        entries.push(BroadcastEntry(campaignName, platform, reformSignal, emotionalTag, true, false));
    }

    function sealBroadcastEntry(uint256 index) external onlyAdmin {
        require(entries[index].broadcasted, "Must be broadcasted first");
        entries[index].sealed = true;
    }

    function getBroadcastEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return entries[index];
    }
}
