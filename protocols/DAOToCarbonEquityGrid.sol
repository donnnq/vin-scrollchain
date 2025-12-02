// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToCarbonEquityGrid {
    string public batchID = "1321.9.234";
    string public steward = "Vinvin";

    address public admin;

    struct Carbon {
        string sector;     // transport, energy, agriculture
        int256 balance;    // emissions vs offsets
        string status;     // equitable, pending, ghost
        uint256 timestamp;
    }

    Carbon[] public carbons;

    event CarbonLogged(string sector, int256 balance, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logCarbon(string memory sector, int256 balance, string memory status) public onlyAdmin {
        carbons.push(Carbon(sector, balance, status, block.timestamp));
        emit CarbonLogged(sector, balance, status);
    }

    function getCarbon(uint256 index) public view returns (string memory sector, int256 balance, string memory status, uint256 timestamp) {
        Carbon memory c = carbons[index];
        return (c.sector, c.balance, c.status, c.timestamp);
    }
}
