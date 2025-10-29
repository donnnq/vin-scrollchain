// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TreatyToPlanetaryInformationSovereigntyBroadcastLedger {
    address public steward;

    struct InfoEntry {
        string outlet; // "Global media networks"
        string clause; // "Scrollchain-sealed ledger for planetary information sovereignty broadcast and editorial consequence"
        string emotionalTag;
        bool broadcasted;
        bool sustained;
    }

    InfoEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function broadcastInformationSovereignty(string memory outlet, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(InfoEntry(outlet, clause, emotionalTag, true, true));
    }

    function getInfoEntry(uint256 index) external view returns (InfoEntry memory) {
        return entries[index];
    }
}
