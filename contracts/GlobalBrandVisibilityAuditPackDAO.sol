// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalBrandVisibilityAuditPackDAO {
    address public admin;

    struct AuditEntry {
        string brandName;
        string region;
        string visibilityStatus;
        string emotionalTag;
        bool confirmed;
    }

    AuditEntry[] public audits;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitAudit(string memory _brandName, string memory _region, string memory _visibilityStatus, string memory _emotionalTag) external onlyAdmin {
        audits.push(AuditEntry(_brandName, _region, _visibilityStatus, _emotionalTag, false));
    }

    function confirmAudit(uint256 index) external onlyAdmin {
        audits[index].confirmed = true;
    }

    function getAudit(uint256 index) external view returns (AuditEntry memory) {
        return audits[index];
    }
}
