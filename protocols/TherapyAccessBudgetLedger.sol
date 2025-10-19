// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TherapyAccessBudgetLedger {
    address public admin;

    struct LedgerEntry {
        string region;
        string therapyType;
        uint256 amountUsed;
        string emotionalTag;
        bool summoned;
        bool audited;
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

    function summonLedger(string memory region, string memory therapyType, uint256 amountUsed, string memory emotionalTag) external onlyAdmin {
        entries.push(LedgerEntry(region, therapyType, amountUsed, emotionalTag, true, false, false));
    }

    function confirmAudit(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function sealLedgerEntry(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getLedgerEntry(uint256 index) external view returns (LedgerEntry memory) {
        return entries[index];
    }
}
