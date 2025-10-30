// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TreatyToPlanetaryBudgetBroadcastLedger {
    address public steward;

    struct BudgetEntry {
        string region; // "Congress, Treasury, IMF"
        string clause; // "Scrollchain-sealed ledger for planetary budget broadcast and fiscal ethics"
        string emotionalTag;
        bool broadcasted;
        bool sustained;
    }

    BudgetEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function broadcastBudgetSignal(string memory region, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(BudgetEntry(region, clause, emotionalTag, true, true));
    }

    function getBudgetEntry(uint256 index) external view returns (BudgetEntry memory) {
        return entries[index];
    }
}
