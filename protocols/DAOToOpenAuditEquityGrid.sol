// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToOpenAuditEquityGrid {
    string public batchID = "1321.9.232";
    string public steward = "Vinvin";

    address public admin;

    struct Audit {
        string entity;     // agency, corporation, NGO
        string status;     // transparent, pending, ghost
        uint256 timestamp;
    }

    Audit[] public audits;

    event AuditLogged(string entity, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logAudit(string memory entity, string memory status) public onlyAdmin {
        audits.push(Audit(entity, status, block.timestamp));
        emit AuditLogged(entity, status);
    }

    function getAudit(uint256 index) public view returns (string memory entity, string memory status, uint256 timestamp) {
        Audit memory a = audits[index];
        return (a.entity, a.status, a.timestamp);
    }
}
