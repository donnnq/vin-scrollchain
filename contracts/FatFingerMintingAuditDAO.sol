// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FatFingerMintingAuditDAO {
    address public admin;

    struct AuditEntry {
        string protocolName;
        string mintingError;
        string emotionalTag;
        bool summoned;
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

    function summonAudit(string memory protocolName, string memory mintingError, string memory emotionalTag) external onlyAdmin {
        entries.push(AuditEntry(protocolName, mintingError, emotionalTag, true, false));
    }

    function resolveAudit(uint256 index) external onlyAdmin {
        entries[index].resolved = true;
    }

    function getAuditEntry(uint256 index) external view returns (AuditEntry memory) {
        return entries[index];
    }
}
