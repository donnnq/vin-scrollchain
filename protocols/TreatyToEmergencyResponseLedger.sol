// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToEmergencyResponseLedger {
    string public batchID = "1321.9.196";
    string public steward = "Vinvin";

    address public admin;

    struct Response {
        string team;        // fire brigade, rescue unit, medical
        string action;      // deployed, pending, audited
        uint256 timestamp;
    }

    Response[] public responses;

    event ResponseLogged(string team, string action);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logResponse(string memory team, string memory action) public onlyAdmin {
        responses.push(Response(team, action, block.timestamp));
        emit ResponseLogged(team, action);
    }

    function getResponse(uint256 index) public view returns (string memory team, string memory action, uint256 timestamp) {
        Response memory r = responses[index];
        return (r.team, r.action, r.timestamp);
    }
}
