// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ProcurementImmunityDAO {
    address public admin;

    struct ProcurementEntry {
        string projectName;
        string lguName;
        uint256 budgetAmount;
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

    function summonProcurement(string memory projectName, string memory lguName, uint256 budgetAmount, string memory emotionalTag) external onlyAdmin {
        entries.push(ProcurementEntry(projectName, lguName, budgetAmount, emotionalTag, true, false, false));
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
