// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FinancialScandalCodex {
    address public admin;

    struct ScandalEntry {
        string country;
        string scandalType;
        string auditClause;
        string emotionalTag;
        bool summoned;
        bool audited;
        bool sealed;
    }

    ScandalEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonScandal(string memory country, string memory scandalType, string memory auditClause, string memory emotionalTag) external onlyAdmin {
        entries.push(ScandalEntry(country, scandalType, auditClause, emotionalTag, true, false, false));
    }

    function confirmAudit(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function sealScandalEntry(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getScandalEntry(uint256 index) external view returns (ScandalEntry memory) {
        return entries[index];
    }
}
