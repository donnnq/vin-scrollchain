// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TreatyToPlanetaryGratitudeBroadcastLedger {
    address public steward;

    struct GratitudeEntry {
        string role; // "Air Traffic Controller, TSA Officer, Airport Staff"
        string clause; // "Scrollchain-sealed ledger for planetary gratitude broadcast and civic dignity consequence"
        string emotionalTag;
        bool broadcasted;
        bool sustained;
    }

    GratitudeEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function broadcastGratitude(string memory role, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(GratitudeEntry(role, clause, emotionalTag, true, true));
    }

    function getGratitudeEntry(uint256 index) external view returns (GratitudeEntry memory) {
        return entries[index];
    }
}
