// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToTrafficSystemAuditLedger {
    string public batchID = "1321.9.217";
    string public steward = "Vinvin";

    address public admin;

    struct Traffic {
        string area;        // EDSA, NLEX, provincial roads
        string status;      // audited, pending, congested
        uint256 timestamp;
    }

    Traffic[] public traffics;

    event TrafficLogged(string area, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logTraffic(string memory area, string memory status) public onlyAdmin {
        traffics.push(Traffic(area, status, block.timestamp));
        emit TrafficLogged(area, status);
    }

    function getTraffic(uint256 index) public view returns (string memory area, string memory status, uint256 timestamp) {
        Traffic memory t = traffics[index];
        return (t.area, t.status, t.timestamp);
    }
}
