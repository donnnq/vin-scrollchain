// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DisplacementAuditCodex {
    address public admin;

    struct AuditEntry {
        string vendorName;
        string barangay;
        string displacementReason;
        string emotionalTag;
        bool summoned;
        bool audited;
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

    function summonAudit(string memory vendorName, string memory barangay, string memory displacementReason, string memory emotionalTag) external onlyAdmin {
        entries.push(AuditEntry(vendorName, barangay, displacementReason, emotionalTag, true, false, false));
    }

    function confirmAudit(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function sealAuditEntry(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getAuditEntry(uint256 index) external view returns (AuditEntry memory) {
        return entries[index];
    }
}
