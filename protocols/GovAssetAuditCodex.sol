// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GovAssetAuditCodex {
    address public admin;

    struct AuditEntry {
        string agencyName;
        string assetType;
        string auditStatus;
        string emotionalTag;
        bool summoned;
        bool reviewed;
        bool sealed;
    }

    AuditEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonAudit(string memory agencyName, string memory assetType, string memory auditStatus, string memory emotionalTag) external onlyAdmin {
        entries.push(AuditEntry(agencyName, assetType, auditStatus, emotionalTag, true, false, false));
    }

    function confirmReview(uint256 index) external onlyAdmin {
        entries[index].reviewed = true;
    }

    function sealAuditEntry(uint256 index) external onlyAdmin {
        require(entries[index].reviewed, "Must be reviewed first");
        entries[index].sealed = true;
    }

    function getAuditEntry(uint256 index) external view returns (AuditEntry memory) {
        return entries[index];
    }
}
