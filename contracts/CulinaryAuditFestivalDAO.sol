// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CulinaryAuditFestivalDAO {
    address public admin;

    struct AuditEntry {
        string dish;
        string region;
        string auditVerdict;
        bool celebrated;
    }

    AuditEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitAudit(string memory _dish, string memory _region, string memory _auditVerdict) external onlyAdmin {
        entries.push(AuditEntry(_dish, _region, _auditVerdict, false));
    }

    function markCelebrated(uint256 index) external onlyAdmin {
        entries[index].celebrated = true;
    }

    function getAudit(uint256 index) external view returns (AuditEntry memory) {
        return entries[index];
    }
}
