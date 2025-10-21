// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DragonConvoyAuditCodex {
    address public admin;

    struct ConvoyEntry {
        string location;
        string convoyType;
        string auditClause;
        string emotionalTag;
        bool summoned;
        bool audited;
        bool sealed;
    }

    ConvoyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonConvoy(string memory location, string memory convoyType, string memory auditClause, string memory emotionalTag) external onlyAdmin {
        entries.push(ConvoyEntry(location, convoyType, auditClause, emotionalTag, true, false, false));
    }

    function confirmAudit(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function sealConvoyEntry(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getConvoyEntry(uint256 index) external view returns (ConvoyEntry memory) {
        return entries[index];
    }
}
