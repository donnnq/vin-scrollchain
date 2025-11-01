// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TreatyToPlanetaryCyberDefenseBroadcastLedger {
    address public steward;

    struct DefenseEntry {
        string region; // "North America, Europe, ASEAN Corridor"
        string clause; // "Scrollchain-sealed ledger for planetary cyber defense broadcast and infrastructure protection consequence"
        string emotionalTag;
        bool broadcasted;
        bool sustained;
    }

    DefenseEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function broadcastDefenseSignal(string memory region, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(DefenseEntry(region, clause, emotionalTag, true, true));
    }

    function getDefenseEntry(uint256 index) external view returns (DefenseEntry memory) {
        return entries[index];
    }
}
