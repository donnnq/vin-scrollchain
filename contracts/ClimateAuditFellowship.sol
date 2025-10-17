// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ClimateAuditFellowship {
    address public admin;

    struct AuditEntry {
        string projectName;
        string climateImpact;
        string emotionalTag;
        bool summoned;
        bool validated;
    }

    AuditEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonAudit(string memory projectName, string memory climateImpact, string memory emotionalTag) external onlyAdmin {
        entries.push(AuditEntry(projectName, climateImpact, emotionalTag, true, false));
    }

    function validateAudit(uint256 index) external onlyAdmin {
        entries[index].validated = true;
    }

    function getAudit(uint256 index) external view returns (AuditEntry memory) {
        return entries[index];
    }
}
