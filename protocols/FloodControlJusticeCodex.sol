// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FloodControlJusticeCodex {
    address public admin;

    struct JusticeEntry {
        string projectName;
        string barangayZone;
        string auditClause;
        string emotionalTag;
        bool summoned;
        bool audited;
        bool sealed;
    }

    JusticeEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonJusticeAudit(string memory projectName, string memory barangayZone, string memory auditClause, string memory emotionalTag) external onlyAdmin {
        entries.push(JusticeEntry(projectName, barangayZone, auditClause, emotionalTag, true, false, false));
    }

    function confirmAudit(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function sealJusticeEntry(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getJusticeEntry(uint256 index) external view returns (JusticeEntry memory) {
        return entries[index];
    }
}
