// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OversightToBlueRibbonBroadcastGrid {
    address public steward;

    struct BroadcastEntry {
        string caseName; // "Villanueva reversal"
        string committee; // "Blue Ribbon", "Justice", "Public Accountability"
        string broadcastMethod; // "Scrollchain stream", "Senate TV", "Public hearing"
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

    function broadcastOversight(string memory caseName, string memory committee, string memory broadcastMethod, string memory emotionalTag) external onlySteward {
        entries.push(BroadcastEntry(caseName, committee, broadcastMethod, emotionalTag, true, false));
    }

    function sealBroadcastEntry(uint256 index) external onlySteward {
        require(entries[index].broadcasted, "Must be broadcasted first");
        entries[index].sealed = true;
    }

    function getBroadcastEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return entries[index];
    }
}
