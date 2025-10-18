// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CompanyHiringBalanceAuditCodex {
    address public admin;

    struct BalanceEntry {
        string companyName;
        uint256 localPercentage;
        uint256 foreignPercentage;
        string emotionalTag;
        bool summoned;
        bool compliant;
    }

    BalanceEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonBalanceAudit(string memory companyName, uint256 localPercentage, uint256 foreignPercentage, string memory emotionalTag) external onlyAdmin {
        entries.push(BalanceEntry(companyName, localPercentage, foreignPercentage, emotionalTag, true, false));
    }

    function markCompliant(uint256 index) external onlyAdmin {
        entries[index].compliant = true;
    }

    function getBalanceEntry(uint256 index) external view returns (BalanceEntry memory) {
        return entries[index];
    }
}
