// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToAirSafetyEquityGrid {
    string public batchID = "1321.9.235";
    string public steward = "Vinvin";

    address public admin;

    struct FlightSafety {
        string airline;     // PAL, Cebu Pacific, international carriers
        string status;      // safe, pending, ghost
        uint256 timestamp;
    }

    FlightSafety[] public safeties;

    event FlightSafetyLogged(string airline, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logSafety(string memory airline, string memory status) public onlyAdmin {
        safeties.push(FlightSafety(airline, status, block.timestamp));
        emit FlightSafetyLogged(airline, status);
    }

    function getSafety(uint256 index) public view returns (string memory airline, string memory status, uint256 timestamp) {
        FlightSafety memory f = safeties[index];
        return (f.airline, f.status, f.timestamp);
    }
}
