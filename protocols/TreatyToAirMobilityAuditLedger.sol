// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToAirMobilityAuditLedger {
    string public batchID = "1321.9.223";
    string public steward = "Vinvin";

    address public admin;

    struct Mobility {
        string system;      // ATC, airport, runway, drone corridor
        string status;      // audited, pending, ghost
        uint256 timestamp;
    }

    Mobility[] public mobilities;

    event MobilityLogged(string system, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logMobility(string memory system, string memory status) public onlyAdmin {
        mobilities.push(Mobility(system, status, block.timestamp));
        emit MobilityLogged(system, status);
    }

    function getMobility(uint256 index) public view returns (string memory system, string memory status, uint256 timestamp) {
        Mobility memory m = mobilities[index];
        return (m.system, m.status, m.timestamp);
    }
}
