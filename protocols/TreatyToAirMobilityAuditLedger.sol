// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToAirMobilityAuditLedger {
    string public batchID = "1321.9.209";
    string public steward = "Vinvin";

    address public admin;

    struct Mobility {
        string airport;     // NAIA, Clark, Davao
        string status;      // audited, pending, ghost
        uint256 timestamp;
    }

    Mobility[] public mobilities;

    event MobilityLogged(string airport, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logMobility(string memory airport, string memory status) public onlyAdmin {
        mobilities.push(Mobility(airport, status, block.timestamp));
        emit MobilityLogged(airport, status);
    }

    function getMobility(uint256 index) public view returns (string memory airport, string memory status, uint256 timestamp) {
        Mobility memory m = mobilities[index];
        return (m.airport, m.status, m.timestamp);
    }
}
