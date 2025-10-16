// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayBuildAuditDAO {
    address public admin;

    struct AuditEntry {
        string purokLabel;
        string projectType;
        string auditDetail;
        string emotionalTag;
        bool completed;
    }

    AuditEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory purokLabel, string memory projectType, string memory auditDetail, string memory emotionalTag) external onlyAdmin {
        entries.push(AuditEntry(purokLabel, projectType, auditDetail, emotionalTag, false));
    }

    function completeEntry(uint256 index) external onlyAdmin {
        entries[index].completed = true;
    }

    function getEntry(uint256 index) external view returns (AuditEntry memory) {
        return entries[index];
    }
}
