// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LegacyAuditCodex {
    address public admin;

    struct LegacyEntry {
        string publicServant;
        string positionHeld;
        string auditClause;
        string emotionalTag;
        bool summoned;
        bool audited;
        bool sealed;
    }

    LegacyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonLegacy(string memory publicServant, string memory positionHeld, string memory auditClause, string memory emotionalTag) external onlyAdmin {
        entries.push(LegacyEntry(publicServant, positionHeld, auditClause, emotionalTag, true, false, false));
    }

    function confirmAudit(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function sealLegacyEntry(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getLegacyEntry(uint256 index) external view returns (LegacyEntry memory) {
        return entries[index];
    }
}
