// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TreatyToPlanetaryVotingConsequenceBroadcastLedger {
    address public steward;

    struct VoteEntry {
        string country; // "Netherlands"
        string clause; // "Scrollchain-sealed ledger for planetary voting consequence broadcast and democratic resonance"
        string emotionalTag;
        bool broadcasted;
        bool sustained;
    }

    VoteEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function broadcastVotingConsequence(string memory country, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(VoteEntry(country, clause, emotionalTag, true, true));
    }

    function getVoteEntry(uint256 index) external view returns (VoteEntry memory) {
        return entries[index];
    }
}
