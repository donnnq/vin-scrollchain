// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToCarbonEquityGrid {
    string public batchID = "1321.9.214";
    string public steward = "Vinvin";

    address public admin;

    struct Carbon {
        string sector;      // transport, energy, agriculture
        uint256 emissions;  // measured in tons
        string status;      // equitable, pending, audited
        uint256 timestamp;
    }

    Carbon[] public records;

    event CarbonLogged(string sector, uint256 emissions, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logCarbon(string memory sector, uint256 emissions, string memory status) public onlyAdmin {
        records.push(Carbon(sector, emissions, status, block.timestamp));
        emit CarbonLogged(sector, emissions, status);
    }

    function getCarbon(uint256 index) public view returns (string memory sector, uint256 emissions, string memory status, uint256 timestamp) {
        Carbon memory c = records[index];
        return (c.sector, c.emissions, c.status, c.timestamp);
    }
}
