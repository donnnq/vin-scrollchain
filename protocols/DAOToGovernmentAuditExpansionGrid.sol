// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToGovernmentAuditExpansionGrid {
    string public batchID = "1321.9.212";
    string public steward = "Vinvin";

    address public admin;

    struct Audit {
        string agency;      // DOF, BIR, PhilHealth, SSS
        string status;      // audited, pending, ghost
        uint256 timestamp;
    }

    Audit[] public audits;

    event AuditLogged(string agency, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logAudit(string memory agency, string memory status) public onlyAdmin {
        audits.push(Audit(agency, status, block.timestamp));
        emit AuditLogged(agency, status);
    }

    function getAudit(uint256 index) public view returns (string memory agency, string memory status, uint256 timestamp) {
        Audit memory a = audits[index];
        return (a.agency, a.status, a.timestamp);
    }
}
