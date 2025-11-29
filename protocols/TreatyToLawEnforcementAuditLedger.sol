// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToLawEnforcementAuditLedger {
    string public batchID = "1321.9.195";
    string public steward = "Vinvin";

    address public admin;

    struct Audit {
        string officer;     // badge or name
        string complaint;   // brutality, misconduct, abuse
        string status;      // investigated, pending, resolved
        uint256 timestamp;
    }

    Audit[] public audits;

    event AuditLogged(string officer, string complaint, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logAudit(string memory officer, string memory complaint, string memory status) public onlyAdmin {
        audits.push(Audit(officer, complaint, status, block.timestamp));
        emit AuditLogged(officer, complaint, status);
    }

    function getAudit(uint256 index) public view returns (string memory officer, string memory complaint, string memory status, uint256 timestamp) {
        Audit memory a = audits[index];
        return (a.officer, a.complaint, a.status, a.timestamp);
    }
}
