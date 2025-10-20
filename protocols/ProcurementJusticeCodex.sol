// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ProcurementJusticeCodex {
    address public admin;

    struct ProcurementEntry {
        string projectName;
        string contractorName;
        string auditClause;
        string emotionalTag;
        bool summoned;
        bool audited;
        bool sealed;
    }

    ProcurementEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonProcurement(string memory projectName, string memory contractorName, string memory auditClause, string memory emotionalTag) external onlyAdmin {
        entries.push(ProcurementEntry(projectName, contractorName, auditClause, emotionalTag, true, false, false));
    }

    function confirmAudit(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function sealProcurementEntry(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getProcurementEntry(uint256 index) external view returns (ProcurementEntry memory) {
        return entries[index];
    }
}
