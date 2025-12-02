// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToSkillsEquityGrid {
    string public batchID = "1321.9.233";
    string public steward = "Vinvin";

    address public admin;

    struct Skill {
        string program;     // coding bootcamp, vocational training, STEM lab
        string status;      // equitable, pending, ghost
        uint256 timestamp;
    }

    Skill[] public skills;

    event SkillLogged(string program, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logSkill(string memory program, string memory status) public onlyAdmin {
        skills.push(Skill(program, status, block.timestamp));
        emit SkillLogged(program, status);
    }

    function getSkill(uint256 index) public view returns (string memory program, string memory status, uint256 timestamp) {
        Skill memory s = skills[index];
        return (s.program, s.status, s.timestamp);
    }
}
