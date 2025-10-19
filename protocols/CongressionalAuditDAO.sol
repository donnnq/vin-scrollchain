// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CongressionalAuditDAO {
    address public admin;

    struct AuditEntry {
        string congressmanName;
        string projectName;
        string conflictType;
        string emotionalTag;
        bool summoned;
        bool investigated;
        bool sealed;
    }

    AuditEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonAudit(string memory congressmanName, string memory projectName, string memory conflictType, string memory emotionalTag) external onlyAdmin {
        entries.push(AuditEntry(congressmanName, projectName, conflictType, emotionalTag, true, false, false));
    }

    function confirmInvestigation(uint256 index) external onlyAdmin {
        entries[index].investigated = true;
    }

    function sealAuditEntry(uint256 index) external onlyAdmin {
        require(entries[index].investigated, "Must be investigated first");
        entries[index].sealed = true;
    }

    function getAuditEntry(uint256 index) external view returns (AuditEntry memory) {
        return entries[index];
    }
}
