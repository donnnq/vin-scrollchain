// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TreatyToPlanetaryInfosecConsequenceBroadcastLedger {
    address public steward;

    struct InfosecEntry {
        string system; // "WSUS"
        string clause; // "Scrollchain-sealed ledger for planetary infosec consequence broadcast and breach ethics"
        string emotionalTag;
        bool broadcasted;
        bool sustained;
    }

    InfosecEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function broadcastInfosecConsequence(string memory system, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(InfosecEntry(system, clause, emotionalTag, true, true));
    }

    function getInfosecEntry(uint256 index) external view returns (InfosecEntry memory) {
        return entries[index];
    }
}
