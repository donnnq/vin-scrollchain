// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InfrastructureReckoningCodex {
    address public admin;

    struct ReckoningEntry {
        string projectName;
        string barangayZone;
        string auditClause;
        string emotionalTag;
        bool summoned;
        bool audited;
        bool sealed;
    }

    ReckoningEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonAudit(string memory projectName, string memory barangayZone, string memory auditClause, string memory emotionalTag) external onlyAdmin {
        entries.push(ReckoningEntry(projectName, barangayZone, auditClause, emotionalTag, true, false, false));
    }

    function confirmAudit(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function sealReckoningEntry(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getReckoningEntry(uint256 index) external view returns (ReckoningEntry memory) {
        return entries[index];
    }
}
