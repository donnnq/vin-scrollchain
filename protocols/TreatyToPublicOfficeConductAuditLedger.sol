// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToPublicOfficeConductAuditLedger {
    string public batchID = "1321.9.236";
    string public steward = "Vinvin";

    address public admin;

    struct Conduct {
        string official;   // senator, mayor, agency head
        string status;     // audited, pending, ghost
        uint256 timestamp;
    }

    Conduct[] public conducts;

    event ConductLogged(string official, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logConduct(string memory official, string memory status) public onlyAdmin {
        conducts.push(Conduct(official, status, block.timestamp));
        emit ConductLogged(official, status);
    }

    function getConduct(uint256 index) public view returns (string memory official, string memory status, uint256 timestamp) {
        Conduct memory c = conducts[index];
        return (c.official, c.status, c.timestamp);
    }
}
