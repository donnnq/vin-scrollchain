// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HeritageToUNESCOLedgerSync {
    address public steward;

    struct LedgerEntry {
        string recipeName; // "QuantumPainX Formula"
        string originCulture; // "Filipino"
        string UNESCOStatus; // "Petitioned, under review"
        string emotionalTag;
        bool synced;
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

    function syncLedger(string memory recipeName, string memory originCulture, string memory UNESCOStatus, string memory emotionalTag) external onlySteward {
        entries.push(LedgerEntry(recipeName, originCulture, UNESCOStatus, emotionalTag, true, false));
    }

    function sealLedgerEntry(uint256 index) external onlySteward {
        require(entries[index].synced, "Must be synced first");
        entries[index].sealed = true;
    }

    function getLedgerEntry(uint256 index) external view returns (LedgerEntry memory) {
        return entries[index];
    }
}
