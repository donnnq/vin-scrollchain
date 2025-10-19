// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ContainerDormAuditCodex {
    address public admin;

    struct AuditEntry {
        string location;
        string operatorName;
        string auditStatus;
        string emotionalTag;
        bool summoned;
        bool inspected;
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

    function summonAudit(string memory location, string memory operatorName, string memory auditStatus, string memory emotionalTag) external onlyAdmin {
        entries.push(AuditEntry(location, operatorName, auditStatus, emotionalTag, true, false, false));
    }

    function confirmInspection(uint256 index) external onlyAdmin {
        entries[index].inspected = true;
    }

    function sealAuditEntry(uint256 index) external onlyAdmin {
        require(entries[index].inspected, "Must be inspected first");
        entries[index].sealed = true;
    }

    function getAuditEntry(uint256 index) external view returns (AuditEntry memory) {
        return entries[index];
    }
}
