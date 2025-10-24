// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UtilityAidToPurokBroadcastGrid {
    address public steward;

    struct BroadcastEntry {
        string purokZone; // "Northville 8"
        string utilityType; // "Electricity", "Water", "Internet"
        string aidMessage; // "Lifeline rate active", "Fuel subsidy available"
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

    function broadcastAid(string memory purokZone, string memory utilityType, string memory aidMessage, string memory emotionalTag) external onlySteward {
        entries.push(BroadcastEntry(purokZone, utilityType, aidMessage, emotionalTag, true, false));
    }

    function sealBroadcastEntry(uint256 index) external onlySteward {
        require(entries[index].broadcasted, "Must be broadcasted first");
        entries[index].sealed = true;
    }

    function getBroadcastEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return entries[index];
    }
}
