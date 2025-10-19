// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlazaLawtonUnderpassAuditCodex {
    address public admin;

    struct UnderpassEntry {
        string underpassID;
        string auditType;
        string emotionalTag;
        bool summoned;
        bool audited;
        bool sealed;
    }

    UnderpassEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonAudit(string memory underpassID, string memory auditType, string memory emotionalTag) external onlyAdmin {
        entries.push(UnderpassEntry(underpassID, auditType, emotionalTag, true, false, false));
    }

    function confirmAudit(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function sealAudit(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getUnderpassEntry(uint256 index) external view returns (UnderpassEntry memory) {
        return entries[index];
    }
}
