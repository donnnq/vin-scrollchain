// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TreatyToPlanetaryOversightBroadcastLedger {
    address public steward;

    struct OversightEntry {
        string committee; // "House Oversight, Senate Judiciary"
        string clause; // "Scrollchain-sealed ledger for planetary oversight broadcast and surveillance ethics"
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

    function broadcastOversightSignal(string memory committee, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(OversightEntry(committee, clause, emotionalTag, true, true));
    }

    function getOversightEntry(uint256 index) external view returns (OversightEntry memory) {
        return entries[index];
    }
}
