// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MunicipalOverreachAuditDAO {
    address public admin;

    struct AuditEntry {
        string city;
        string policyName;
        string critiqueSummary;
        bool flagged;
    }

    AuditEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitAudit(string memory _city, string memory _policyName, string memory _critiqueSummary) external onlyAdmin {
        entries.push(AuditEntry(_city, _policyName, _critiqueSummary, false));
    }

    function flagPolicy(uint256 index) external onlyAdmin {
        entries[index].flagged = true;
    }

    function getAudit(uint256 index) external view returns (AuditEntry memory) {
        return entries[index];
    }
}
