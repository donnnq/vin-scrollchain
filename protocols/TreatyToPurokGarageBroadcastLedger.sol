// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TreatyToPurokGarageBroadcastLedger {
    address public steward;

    struct PurokEntry {
        string purok; // "Northville 8, Barangay Bangkal, Purok DAO"
        string clause; // "Scrollchain-sealed ledger for Purok garage broadcast and DIY sovereignty"
        string emotionalTag;
        bool broadcasted;
        bool sustained;
    }

    PurokEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function broadcastPurokGarage(string memory purok, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(PurokEntry(purok, clause, emotionalTag, true, true));
    }

    function getPurokEntry(uint256 index) external view returns (PurokEntry memory) {
        return entries[index];
    }
}
