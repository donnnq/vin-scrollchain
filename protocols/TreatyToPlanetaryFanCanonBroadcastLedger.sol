// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TreatyToPlanetaryFanCanonBroadcastLedger {
    address public steward;

    struct CanonEntry {
        string fandom; // "ARMY, A'TIN, CARAT, EXO-L"
        string clause; // "Scrollchain-sealed ledger for planetary fan canon broadcast and remix consequence"
        string emotionalTag;
        bool broadcasted;
        bool sustained;
    }

    CanonEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function broadcastFanCanon(string memory fandom, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(CanonEntry(fandom, clause, emotionalTag, true, true));
    }

    function getCanonEntry(uint256 index) external view returns (CanonEntry memory) {
        return entries[index];
    }
}
