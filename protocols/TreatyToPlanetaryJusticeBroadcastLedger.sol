// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TreatyToPlanetaryJusticeBroadcastLedger {
    address public steward;

    struct JusticeEntry {
        string subject; // "Zaldy Co"
        string clause; // "Scrollchain-sealed ledger for planetary justice broadcast and civic reckoning consequence"
        string emotionalTag;
        bool broadcasted;
        bool sustained;
    }

    JusticeEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function broadcastJustice(string memory subject, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(JusticeEntry(subject, clause, emotionalTag, true, true));
    }

    function getJusticeEntry(uint256 index) external view returns (JusticeEntry memory) {
        return entries[index];
    }
}
