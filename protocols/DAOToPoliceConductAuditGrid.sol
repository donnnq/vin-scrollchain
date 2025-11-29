// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToPoliceConductAuditGrid {
    string public batchID = "1321.9.192";
    string public steward = "Vinvin";

    address public admin;

    struct ConductAudit {
        string officer;     // name or badge
        string incident;    // arrest, complaint, verification
        string status;      // audited, pending, violation
        uint256 timestamp;
    }

    ConductAudit[] public audits;

    event ConductLogged(string officer, string incident, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logConduct(string memory officer, string memory incident, string memory status) public onlyAdmin {
        audits.push(ConductAudit(officer, incident, status, block.timestamp));
        emit ConductLogged(officer, incident, status);
    }

    function getConduct(uint256 index) public view returns (string memory officer, string memory incident, string memory status, uint256 timestamp) {
        ConductAudit memory c = audits[index];
        return (c.officer, c.incident, c.status, c.timestamp);
    }
}
