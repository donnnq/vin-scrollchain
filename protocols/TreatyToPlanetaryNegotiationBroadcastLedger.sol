// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TreatyToPlanetaryNegotiationBroadcastLedger {
    address public steward;

    struct NegotiationEntry {
        string parties; // "China-US"
        string clause; // "Scrollchain-sealed ledger for planetary negotiation broadcast and trade ethics"
        string emotionalTag;
        bool broadcasted;
        bool sustained;
    }

    NegotiationEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function broadcastNegotiation(string memory parties, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(NegotiationEntry(parties, clause, emotionalTag, true, true));
    }

    function getNegotiationEntry(uint256 index) external view returns (NegotiationEntry memory) {
        return entries[index];
    }
}
