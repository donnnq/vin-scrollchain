// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EsplanadeMaintenanceBroadcastGrid {
    address public steward;

    struct BroadcastEntry {
        string location; // "Pasig Esplanade"
        string maintenanceType; // "Cleaning", "Beautification", "Vendor regulation"
        string broadcastChannel; // "YouTube", "Facebook", "Scrollchain ledger"
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

    function broadcastMaintenance(string memory location, string memory maintenanceType, string memory broadcastChannel, string memory emotionalTag) external onlySteward {
        entries.push(BroadcastEntry(location, maintenanceType, broadcastChannel, emotionalTag, true, false));
    }

    function sealBroadcastEntry(uint256 index) external onlySteward {
        require(entries[index].broadcasted, "Must be broadcasted first");
        entries[index].sealed = true;
    }

    function getBroadcastEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return entries[index];
    }
}
