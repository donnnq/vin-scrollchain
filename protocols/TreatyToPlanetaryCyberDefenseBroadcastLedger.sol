// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TreatyToPlanetaryCyberDefenseBroadcastLedger {
    address public steward;

    struct DefenseEntry {
        string system; // "WSUS"
        string clause; // "Scrollchain-sealed ledger for planetary cyber defense broadcast and exploit consequence"
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

    function broadcastDefenseSignal(string memory system, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(DefenseEntry(system, clause, emotionalTag, true, true));
    }

    function getDefenseEntry(uint256 index) external view returns (DefenseEntry memory) {
        return entries[index];
    }
}
