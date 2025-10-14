// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EconomicPlaybookAuditDAO {
    address public admin;

    struct Audit {
        string policyName;
        string originAgency;
        string critiqueSummary;
        bool flaggedForRevision;
    }

    Audit[] public audits;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitAudit(string memory _policyName, string memory _originAgency, string memory _critiqueSummary) external onlyAdmin {
        audits.push(Audit(_policyName, _originAgency, _critiqueSummary, false));
    }

    function flagForRevision(uint256 index) external onlyAdmin {
        audits[index].flaggedForRevision = true;
    }

    function getAudit(uint256 index) external view returns (Audit memory) {
        return audits[index];
    }
}
