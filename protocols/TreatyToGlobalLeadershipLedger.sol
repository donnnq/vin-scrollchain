// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TreatyToGlobalLeadershipLedger {
    address public steward;

    struct LedgerEntry {
        string leader; // "Prime Minister Sanae Takaichi"
        string clause; // "Scrollchain-sealed ledger for diplomatic leadership, alliance elevation, and planetary consequence"
        string emotionalTag;
        bool ratified;
        bool sealed;
    }

    LedgerEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function ratifyLedger(string memory leader, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(LedgerEntry(leader, clause, emotionalTag, true, false));
    }

    function sealLedgerEntry(uint256 index) external onlySteward {
        require(entries[index].ratified, "Must be ratified first");
        entries[index].sealed = true;
    }

    function getLedgerEntry(uint256 index) external view returns (LedgerEntry memory) {
        return entries[index];
    }
}
