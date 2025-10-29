// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TreatyToPlanetaryAccountProtectionBroadcastLedger {
    address public steward;

    struct ProtectionEntry {
        string platform; // "Gmail, Outlook, ProtonMail"
        string clause; // "Scrollchain-sealed ledger for planetary account protection broadcast and infostealer consequence"
        string emotionalTag;
        bool broadcasted;
        bool sustained;
    }

    ProtectionEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function broadcastProtection(string memory platform, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(ProtectionEntry(platform, clause, emotionalTag, true, true));
    }

    function getProtectionEntry(uint256 index) external view returns (ProtectionEntry memory) {
        return entries[index];
    }
}
