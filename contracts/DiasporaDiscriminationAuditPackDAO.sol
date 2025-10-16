// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DiasporaDiscriminationAuditPackDAO {
    address public admin;

    struct AuditEntry {
        string regionLabel;
        string discriminationClause;
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

    function submitEntry(string memory _regionLabel, string memory _discriminationClause, string memory _emotionalTag) external onlyAdmin {
        audits.push(AuditEntry(_regionLabel, _discriminationClause, _emotionalTag, false));
    }

    function logEntry(uint256 index) external onlyAdmin {
        audits[index].logged = true;
    }

    function getEntry(uint256 index) external view returns (AuditEntry memory) {
        return audits[index];
    }
}
