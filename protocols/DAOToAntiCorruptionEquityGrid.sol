// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToAntiCorruptionEquityGrid {
    string public batchID = "1321.9.236";
    string public steward = "Vinvin";

    address public admin;

    struct Case {
        string office;     // DPWH, DOF, LGU
        string status;     // transparent, pending, ghost
        uint256 timestamp;
    }

    Case[] public cases;

    event CaseLogged(string office, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logCase(string memory office, string memory status) public onlyAdmin {
        cases.push(Case(office, status, block.timestamp));
        emit CaseLogged(office, status);
    }

    function getCase(uint256 index) public view returns (string memory office, string memory status, uint256 timestamp) {
        Case memory c = cases[index];
        return (c.office, c.status, c.timestamp);
    }
}
