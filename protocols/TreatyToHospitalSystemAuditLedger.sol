// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToHospitalSystemAuditLedger {
    string public batchID = "1321.9.219";
    string public steward = "Vinvin";

    address public admin;

    struct Hospital {
        string name;        // PGH, provincial hospital, rural clinic
        string status;      // audited, pending, ghost
        uint256 timestamp;
    }

    Hospital[] public hospitals;

    event HospitalLogged(string name, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logHospital(string memory name, string memory status) public onlyAdmin {
        hospitals.push(Hospital(name, status, block.timestamp));
        emit HospitalLogged(name, status);
    }

    function getHospital(uint256 index) public view returns (string memory name, string memory status, uint256 timestamp) {
        Hospital memory h = hospitals[index];
        return (h.name, h.status, h.timestamp);
    }
}
