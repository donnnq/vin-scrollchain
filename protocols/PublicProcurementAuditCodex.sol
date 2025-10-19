// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicProcurementAuditCodex {
    address public admin;

    struct ProcurementEntry {
        string agencyName;
        string contractTitle;
        string auditStatus;
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

    function summonProcurement(string memory agencyName, string memory contractTitle, string memory auditStatus, string memory emotionalTag) external onlyAdmin {
        entries.push(ProcurementEntry(agencyName, contractTitle, auditStatus, emotionalTag, true, false, false));
    }

    function confirmAudit(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function sealProcurement(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getProcurementEntry(uint256 index) external view returns (ProcurementEntry memory) {
        return entries[index];
    }
}
