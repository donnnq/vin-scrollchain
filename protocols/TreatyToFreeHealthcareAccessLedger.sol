// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToFreeHealthcareAccessLedger {
    string public batchID = "1321.9.206";
    string public steward = "Vinvin";

    address public admin;

    struct Access {
        string community;   // urban poor, rural, coastal
        string service;     // hospitalization, medicine, checkup
        string status;      // free, pending, audited
        uint256 timestamp;
    }

    Access[] public accesses;

    event AccessLogged(string community, string service, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logAccess(string memory community, string memory service, string memory status) public onlyAdmin {
        accesses.push(Access(community, service, status, block.timestamp));
        emit AccessLogged(community, service, status);
    }

    function getAccess(uint256 index) public view returns (string memory community, string memory service, string memory status, uint256 timestamp) {
        Access memory a = accesses[index];
        return (a.community, a.service, a.status, a.timestamp);
    }
}
