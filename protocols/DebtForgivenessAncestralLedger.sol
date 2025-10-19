// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DebtForgivenessAncestralLedger {
    address public admin;

    struct LedgerEntry {
        string countryName;
        string creditorEntity;
        string ancestralJustification;
        string emotionalTag;
        bool summoned;
        bool forgiven;
        bool sealed;
    }

    LedgerEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonForgiveness(string memory countryName, string memory creditorEntity, string memory ancestralJustification, string memory emotionalTag) external onlyAdmin {
        entries.push(LedgerEntry(countryName, creditorEntity, ancestralJustification, emotionalTag, true, false, false));
    }

    function confirmForgiveness(uint256 index) external onlyAdmin {
        entries[index].forgiven = true;
    }

    function sealLedgerEntry(uint256 index) external onlyAdmin {
        require(entries[index].forgiven, "Must be forgiven first");
        entries[index].sealed = true;
    }

    function getLedgerEntry(uint256 index) external view returns (LedgerEntry memory) {
        return entries[index];
    }
}
