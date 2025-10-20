// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ConfidentialFundAuditDAO {
    address public admin;

    struct FundEntry {
        string officeName;
        string fundPeriod;
        string auditClause;
        string emotionalTag;
        bool summoned;
        bool audited;
        bool sealed;
    }

    FundEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonAudit(string memory officeName, string memory fundPeriod, string memory auditClause, string memory emotionalTag) external onlyAdmin {
        entries.push(FundEntry(officeName, fundPeriod, auditClause, emotionalTag, true, false, false));
    }

    function confirmAudit(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function sealFundEntry(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getFundEntry(uint256 index) external view returns (FundEntry memory) {
        return entries[index];
    }
}
