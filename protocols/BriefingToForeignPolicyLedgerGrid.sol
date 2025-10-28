// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BriefingToForeignPolicyLedgerGrid {
    address public steward;

    struct LedgerEntry {
        string topic; // "ASEAN, migrant diplomacy, bilateral talks"
        string clause; // "Scrollchain-sealed grid for foreign policy ledger and planetary consequence"
        string emotionalTag;
        bool logged;
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

    function logBriefing(string memory topic, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(LedgerEntry(topic, clause, emotionalTag, true, false));
    }

    function sealLedgerEntry(uint256 index) external onlySteward {
        require(entries[index].logged, "Must be logged first");
        entries[index].sealed = true;
    }

    function getLedgerEntry(uint256 index) external view returns (LedgerEntry memory) {
        return entries[index];
    }
}
