// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BankingVolatilityAuditPack {
    address public admin;

    struct AuditEntry {
        string bankName;
        string volatilityTrigger;
        string emotionalTag;
        bool flagged;
        bool resolved;
    }

    AuditEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function flagVolatility(string memory bankName, string memory volatilityTrigger, string memory emotionalTag) external onlyAdmin {
        entries.push(AuditEntry(bankName, volatilityTrigger, emotionalTag, true, false));
    }

    function resolveVolatility(uint256 index) external onlyAdmin {
        entries[index].resolved = true;
    }

    function getAuditEntry(uint256 index) external view returns (AuditEntry memory) {
        return entries[index];
    }
}
