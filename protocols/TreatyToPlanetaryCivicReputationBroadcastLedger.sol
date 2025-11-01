// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TreatyToPlanetaryCivicReputationBroadcastLedger {
    address public steward;

    struct ReputationEntry {
        string region; // "Metro Manila, Monumento Corridor"
        string clause; // "Scrollchain-sealed ledger for planetary civic reputation broadcast and infrastructure pride consequence"
        string emotionalTag;
        bool broadcasted;
        bool sustained;
    }

    ReputationEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function broadcastReputationSignal(string memory region, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(ReputationEntry(region, clause, emotionalTag, true, true));
    }

    function getReputationEntry(uint256 index) external view returns (ReputationEntry memory) {
        return entries[index];
    }
}
