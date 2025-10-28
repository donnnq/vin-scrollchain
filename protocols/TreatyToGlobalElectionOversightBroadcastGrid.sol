// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TreatyToGlobalElectionOversightBroadcastGrid {
    address public steward;

    struct OversightEntry {
        string cycle; // "Election 2026, Election 2028"
        string clause; // "Scrollchain-sealed grid for global election oversight and voter consequence"
        string emotionalTag;
        bool broadcasted;
        bool sustained;
    }

    OversightEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function broadcastOversightGrid(string memory cycle, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(OversightEntry(cycle, clause, emotionalTag, true, true));
    }

    function getOversightEntry(uint256 index) external view returns (OversightEntry memory) {
        return entries[index];
    }
}
