// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RegistryExfiltrationAuditDAO {
    address public admin;

    struct AuditEntry {
        string packageName;
        string registry;
        string exfiltrationVector;
        string emotionalTag;
        bool flagged;
        bool resolved;
    }

    AuditEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function flagPackage(string memory packageName, string memory registry, string memory exfiltrationVector, string memory emotionalTag) external onlyAdmin {
        entries.push(AuditEntry(packageName, registry, exfiltrationVector, emotionalTag, true, false));
    }

    function resolveAudit(uint256 index) external onlyAdmin {
        entries[index].resolved = true;
    }

    function getAuditEntry(uint256 index) external view returns (AuditEntry memory) {
        return entries[index];
    }
}
