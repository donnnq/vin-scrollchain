// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ImportToKarmicLedgerActivation {
    address public steward;

    struct LedgerEntry {
        string importSource; // "Argentina"
        string productType; // "Beef"
        string karmicSignal; // "Market chaos", "Farmer displacement", "Sovereignty breach"
        string emotionalTag;
        bool activated;
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

    function activateLedger(string memory importSource, string memory productType, string memory karmicSignal, string memory emotionalTag) external onlySteward {
        entries.push(LedgerEntry(importSource, productType, karmicSignal, emotionalTag, true, false));
    }

    function sealLedgerEntry(uint256 index) external onlySteward {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getLedgerEntry(uint256 index) external view returns (LedgerEntry memory) {
        return entries[index];
    }
}
