// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DisasterResponseAuditDAO {
    address public admin;

    struct AuditEntry {
        string responseType;
        string agencyName;
        string purokName;
        string emotionalTag;
        bool deployed;
        bool audited;
    }

    AuditEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logResponse(string memory responseType, string memory agencyName, string memory purokName, string memory emotionalTag) external onlyAdmin {
        entries.push(AuditEntry(responseType, agencyName, purokName, emotionalTag, true, false));
    }

    function auditResponse(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function getAudit(uint256 index) external view returns (AuditEntry memory) {
        return entries[index];
    }
}
