// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToCommunalAuditExpansionGrid {
    string public batchID = "1321.9.218";
    string public steward = "Vinvin";

    address public admin;

    struct Audit {
        string domain;      // health, education, energy, transport
        string status;      // audited, pending, ghost
        uint256 timestamp;
    }

    Audit[] public audits;

    event AuditLogged(string domain, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logAudit(string memory domain, string memory status) public onlyAdmin {
        audits.push(Audit(domain, status, block.timestamp));
        emit AuditLogged(domain, status);
    }

    function getAudit(uint256 index) public view returns (string memory domain, string memory status, uint256 timestamp) {
        Audit memory a = audits[index];
        return (a.domain, a.status, a.timestamp);
    }
}
