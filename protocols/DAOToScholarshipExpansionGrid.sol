// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToScholarshipExpansionGrid {
    string public batchID = "1321.9.213";
    string public steward = "Vinvin";

    address public admin;

    struct Scholarship {
        string program;     // STEM, arts, vocational
        string status;      // granted, pending, audited
        uint256 timestamp;
    }

    Scholarship[] public scholarships;

    event ScholarshipLogged(string program, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logScholarship(string memory program, string memory status) public onlyAdmin {
        scholarships.push(Scholarship(program, status, block.timestamp));
        emit ScholarshipLogged(program, status);
    }

    function getScholarship(uint256 index) public view returns (string memory program, string memory status, uint256 timestamp) {
        Scholarship memory s = scholarships[index];
        return (s.program, s.status, s.timestamp);
    }
}
