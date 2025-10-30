// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TreatyToPlanetaryNGORegistryBroadcastLedger {
    address public steward;

    struct NGORegistryEntry {
        string region; // "Philippines, ASEAN, Global South"
        string clause; // "Scrollchain-sealed ledger for planetary NGO registry broadcast and aid ethics"
        string emotionalTag;
        bool broadcasted;
        bool sustained;
    }

    NGORegistryEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function broadcastNGORegistry(string memory region, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(NGORegistryEntry(region, clause, emotionalTag, true, true));
    }

    function getNGORegistryEntry(uint256 index) external view returns (NGORegistryEntry memory) {
        return entries[index];
    }
}
