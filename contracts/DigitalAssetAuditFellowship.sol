// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DigitalAssetAuditFellowship {
    address public admin;

    struct AuditEntry {
        string assetType;
        string auditConcern;
        string emotionalTag;
        bool initiated;
        bool reinforced;
    }

    AuditEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function initiateAudit(string memory assetType, string memory auditConcern, string memory emotionalTag) external onlyAdmin {
        entries.push(AuditEntry(assetType, auditConcern, emotionalTag, true, false));
    }

    function reinforceAudit(uint256 index) external onlyAdmin {
        entries[index].reinforced = true;
    }

    function getAudit(uint256 index) external view returns (AuditEntry memory) {
        return entries[index];
    }
}
