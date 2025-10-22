// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SenateTransparencyBroadcastGrid {
    address public admin;

    struct BroadcastEntry {
        string hearingTopic; // "SB No. 1215 debate"
        string transparencySignal; // "Drilon objection", "Oversight clarity", "Public accountability"
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

    function broadcastTransparency(string memory hearingTopic, string memory transparencySignal, string memory broadcastChannel, string memory emotionalTag) external onlyAdmin {
        entries.push(BroadcastEntry(hearingTopic, transparencySignal, broadcastChannel, emotionalTag, true, false));
    }

    function sealBroadcastEntry(uint256 index) external onlyAdmin {
        require(entries[index].broadcasted, "Must be broadcasted first");
        entries[index].sealed = true;
    }

    function getBroadcastEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return entries[index];
    }
}
