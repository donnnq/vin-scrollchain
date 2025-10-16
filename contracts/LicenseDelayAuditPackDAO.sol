// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LicenseDelayAuditPackDAO {
    address public admin;

    struct AuditEntry {
        string institutionLabel;
        string delayClause;
        string emotionalTag;
        bool logged;
    }

    AuditEntry[] public audits;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _institutionLabel, string memory _delayClause, string memory _emotionalTag) external onlyAdmin {
        audits.push(AuditEntry(_institutionLabel, _delayClause, _emotionalTag, false));
    }

    function logEntry(uint256 index) external onlyAdmin {
        audits[index].logged = true;
    }

    function getEntry(uint256 index) external view returns (AuditEntry memory) {
        return audits[index];
    }
}
