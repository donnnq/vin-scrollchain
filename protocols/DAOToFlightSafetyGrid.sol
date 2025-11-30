// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToFlightSafetyGrid {
    string public batchID = "1321.9.209";
    string public steward = "Vinvin";

    address public admin;

    struct FlightSafety {
        string airline;     // PAL, Cebu Pacific, international carrier
        string status;      // safe, pending, audited
        uint256 timestamp;
    }

    FlightSafety[] public flights;

    event FlightSafetyLogged(string airline, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logFlightSafety(string memory airline, string memory status) public onlyAdmin {
        flights.push(FlightSafety(airline, status, block.timestamp));
        emit FlightSafetyLogged(airline, status);
    }

    function getFlightSafety(uint256 index) public view returns (string memory airline, string memory status, uint256 timestamp) {
        FlightSafety memory f = flights[index];
        return (f.airline, f.status, f.timestamp);
    }
}
