// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToAuditGrid {
    string public batchID = "1321.9.165";
    string public steward = "Vinvin";

    address public admin;

    struct AuditProcess {
        string entity;      // agency, company
        string scope;       // financial, operational, compliance
        string status;      // pending, completed, published
        uint256 timestamp;
    }

    AuditProcess[] public audits;

    event AuditLogged(string entity, string scope, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logAudit(string memory entity, string memory scope, string memory status) public onlyAdmin {
        audits.push(AuditProcess(entity, scope, status, block.timestamp));
        emit AuditLogged(entity, scope, status);
    }

    function getAudit(uint256 index) public view returns (string memory entity, string memory scope, string memory status, uint256 timestamp) {
        AuditProcess memory a = audits[index];
        return (a.entity, a.scope, a.status, a.timestamp);
    }
}
