// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BudgetAllocationTransparencyGrid {
    address public admin;

    struct AllocationEntry {
        string department; // "DPWH", "DepEd"
        uint256 allocatedAmount;
        uint256 spentAmount;
        string transparencyLayer; // "Delayed Disbursement", "Unclear Procurement", "Underutilization"
        string emotionalTag;
        bool summoned;
        bool audited;
        bool sealed;
    }

    AllocationEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonAllocation(string memory department, uint256 allocatedAmount, uint256 spentAmount, string memory transparencyLayer, string memory emotionalTag) external onlyAdmin {
        entries.push(AllocationEntry(department, allocatedAmount, spentAmount, transparencyLayer, emotionalTag, true, false, false));
    }

    function confirmAudit(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function sealAllocationEntry(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getAllocationEntry(uint256 index) external view returns (AllocationEntry memory) {
        return entries[index];
    }
}
