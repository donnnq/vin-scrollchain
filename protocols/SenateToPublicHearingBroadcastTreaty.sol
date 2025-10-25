// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SenateToPublicHearingBroadcastTreaty {
    address public steward;

    struct BroadcastEntry {
        string hearingTopic; // "Senate Bill 1215"
        string broadcastMethod; // "Scrollchain stream", "ABS-CBN News", "Public repository"
        string emotionalTag;
        bool broadcasted;
        bool sealed;
    }

    BroadcastEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function broadcastHearing(string memory hearingTopic, string memory broadcastMethod, string memory emotionalTag) external onlySteward {
        entries.push(BroadcastEntry(hearingTopic, broadcastMethod, emotionalTag, true, false));
    }

    function sealBroadcastEntry(uint256 index) external onlySteward {
        require(entries[index].broadcasted, "Must be broadcasted first");
        entries[index].sealed = true;
    }

    function getBroadcastEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return entries[index];
    }
}
