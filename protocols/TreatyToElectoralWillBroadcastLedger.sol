// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TreatyToElectoralWillBroadcastLedger {
    address public steward;

    struct BroadcastEntry {
        string message; // "People want Trump back"
        string clause; // "Scrollchain-sealed ledger for electoral will and democratic consequence"
        string emotionalTag;
        bool broadcasted;
        bool sustained;
    }

    BroadcastEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function broadcastElectoralWill(string memory message, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(BroadcastEntry(message, clause, emotionalTag, true, true));
    }

    function getBroadcastEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return entries[index];
    }
}
