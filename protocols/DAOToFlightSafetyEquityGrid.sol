// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToFlightSafetyEquityGrid {
    string public batchID = "1321.9.223";
    string public steward = "Vinvin";

    address public admin;

    struct Flight {
        string airline;     // PAL, Cebu Pacific, international carriers
        string status;      // safe, pending, audited
        uint256 timestamp;
    }

    Flight[] public flights;

    event FlightLogged(string airline, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logFlight(string memory airline, string memory status) public onlyAdmin {
        flights.push(Flight(airline, status, block.timestamp));
        emit FlightLogged(airline, status);
    }

    function getFlight(uint256 index) public view returns (string memory airline, string memory status, uint256 timestamp) {
        Flight memory f = flights[index];
        return (f.airline, f.status, f.timestamp);
    }
}
