// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TreatyToPlanetaryTariffConsequenceBroadcastLedger {
    address public steward;

    struct TariffEntry {
        string region; // "Asia-Pacific, EU, Americas"
        string clause; // "Scrollchain-sealed ledger for planetary tariff consequence broadcast and trade ethics"
        string emotionalTag;
        bool broadcasted;
        bool sustained;
    }

    TariffEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function broadcastTariffConsequence(string memory region, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(TariffEntry(region, clause, emotionalTag, true, true));
    }

    function getTariffEntry(uint256 index) external view returns (TariffEntry memory) {
        return entries[index];
    }
}
