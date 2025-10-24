// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PurokToAidVisibilityBroadcast {
    address public steward;

    struct BroadcastEntry {
        string purokZone; // "Northville 8"
        string aidType; // "Food credit", "Water discount", "Electricity relief"
        string visibilityStatus; // "Public", "Pending", "Restricted"
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

    function broadcastVisibility(string memory purokZone, string memory aidType, string memory visibilityStatus, string memory emotionalTag) external onlySteward {
        entries.push(BroadcastEntry(purokZone, aidType, visibilityStatus, emotionalTag, true, false));
    }

    function sealBroadcastEntry(uint256 index) external onlySteward {
        require(entries[index].broadcasted, "Must be broadcasted first");
        entries[index].sealed = true;
    }

    function getBroadcastEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return entries[index];
    }
}
