// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RedFlagProjectAuditDAO {
    address public admin;

    struct ProjectEntry {
        string projectName;
        uint256 budgetInPHP;
        string riskType; // "Ghost Project", "Overpricing", "Conflict of Interest"
        string emotionalTag;
        bool summoned;
        bool audited;
        bool sealed;
    }

    ProjectEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonAudit(string memory projectName, uint256 budgetInPHP, string memory riskType, string memory emotionalTag) external onlyAdmin {
        entries.push(ProjectEntry(projectName, budgetInPHP, riskType, emotionalTag, true, false, false));
    }

    function confirmAudit(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function sealAuditEntry(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getProjectEntry(uint256 index) external view returns (ProjectEntry memory) {
        return entries[index];
    }
}
