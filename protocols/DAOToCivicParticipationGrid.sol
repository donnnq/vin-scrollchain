// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToCivicParticipationGrid {
    string public batchID = "1321.9.200";
    string public steward = "Vinvin";

    address public admin;

    struct Participation {
        string program;     // leadership camp, debate, volunteer work
        string status;      // active, pending, audited
        uint256 timestamp;
    }

    Participation[] public participations;

    event ParticipationLogged(string program, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logParticipation(string memory program, string memory status) public onlyAdmin {
        participations.push(Participation(program, status, block.timestamp));
        emit ParticipationLogged(program, status);
    }

    function getParticipation(uint256 index) public view returns (string memory program, string memory status, uint256 timestamp) {
        Participation memory p = participations[index];
        return (p.program, p.status, p.timestamp);
    }
}
