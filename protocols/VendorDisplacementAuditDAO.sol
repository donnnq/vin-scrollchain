// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VendorDisplacementAuditDAO {
    address public admin;

    struct DisplacementEntry {
        string district;
        string vendorType;
        string auditClause;
        string emotionalTag;
        bool summoned;
        bool audited;
        bool sealed;
    }

    DisplacementEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonDisplacementAudit(string memory district, string memory vendorType, string memory auditClause, string memory emotionalTag) external onlyAdmin {
        entries.push(DisplacementEntry(district, vendorType, auditClause, emotionalTag, true, false, false));
    }

    function confirmAudit(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function sealDisplacementEntry(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getDisplacementEntry(uint256 index) external view returns (DisplacementEntry memory) {
        return entries[index];
    }
}
