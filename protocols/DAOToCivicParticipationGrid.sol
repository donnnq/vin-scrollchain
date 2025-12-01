// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToCivicParticipationGrid {
    string public batchID = "1321.9.222";
    string public steward = "Vinvin";

    address public admin;

    struct Participation {
        string initiative;   // student council, youth parliament, community project
        string status;       // active, pending, audited
        uint256 timestamp;
    }

    Participation[] public participations;

    event ParticipationLogged(string initiative, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logParticipation(string memory initiative, string memory status) public onlyAdmin {
        participations.push(Participation(initiative, status, block.timestamp));
        emit ParticipationLogged(initiative, status);
    }

    function getParticipation(uint256 index) public view returns (string memory initiative, string memory status, uint256 timestamp) {
        Participation memory p = participations[index];
        return (p.initiative, p.status, p.timestamp);
    }
}
