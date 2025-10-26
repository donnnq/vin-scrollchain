// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayToRestorationBroadcastProtocol {
    address public steward;

    struct BroadcastEntry {
        string zoneType; // "Barangay interior"
        string broadcastMessage; // "Dignity zone, exempt from highway enforcement"
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

    function broadcastZone(string memory zoneType, string memory broadcastMessage, string memory emotionalTag) external onlySteward {
        entries.push(BroadcastEntry(zoneType, broadcastMessage, emotionalTag, true, false));
    }

    function sealBroadcastEntry(uint256 index) external onlySteward {
        require(entries[index].broadcasted, "Must be broadcasted first");
        entries[index].sealed = true;
    }

    function getBroadcastEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return entries[index];
    }
}
