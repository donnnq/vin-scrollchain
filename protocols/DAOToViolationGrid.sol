// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToViolationGrid {
    string public batchID = "1321.9.172";
    string public steward = "Vinvin";

    address public admin;

    struct Violation {
        string company;     // name of company
        string offense;     // unpaid wages, unsafe conditions, denied benefits
        uint256 severity;   // scale 1-10
        uint256 timestamp;
    }

    Violation[] public violations;

    event ViolationLogged(string company, string offense, uint256 severity);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logViolation(string memory company, string memory offense, uint256 severity) public onlyAdmin {
        violations.push(Violation(company, offense, severity, block.timestamp));
        emit ViolationLogged(company, offense, severity);
    }

    function getViolation(uint256 index) public view returns (string memory company, string memory offense, uint256 severity, uint256 timestamp) {
        Violation memory v = violations[index];
        return (v.company, v.offense, v.severity, v.timestamp);
    }
}
