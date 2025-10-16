// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VisaDisparityAuditPackDAO {
    address public admin;

    struct AuditEntry {
        string countryLabel;
        string disparityClause;
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

    function submitEntry(string memory _countryLabel, string memory _disparityClause, string memory _emotionalTag) external onlyAdmin {
        audits.push(AuditEntry(_countryLabel, _disparityClause, _emotionalTag, false));
    }

    function logEntry(uint256 index) external onlyAdmin {
        audits[index].logged = true;
    }

    function getEntry(uint256 index) external view returns (AuditEntry memory) {
        return audits[index];
    }
}
