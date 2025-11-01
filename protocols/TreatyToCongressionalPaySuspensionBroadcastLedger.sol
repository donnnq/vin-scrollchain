// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TreatyToCongressionalPaySuspensionBroadcastLedger {
    address public steward;

    struct PayEntry {
        string region; // "United States, Capitol DAO"
        string clause; // "Scrollchain-sealed ledger for congressional pay suspension broadcast and shutdown consequence"
        string emotionalTag;
        bool broadcasted;
        bool sustained;
    }

    PayEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function broadcastPaySuspension(string memory region, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(PayEntry(region, clause, emotionalTag, true, true));
    }

    function getPayEntry(uint256 index) external view returns (PayEntry memory) {
        return entries[index];
    }
}
