// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToInstitutionalChecksLedger {
    string public batchID = "1321.9.182";
    string public steward = "Vinvin";

    address public admin;

    struct Check {
        string institution; // judiciary, legislature, commission
        string role;        // oversight, review, balance
        uint256 timestamp;
    }

    Check[] public checks;

    event CheckLogged(string institution, string role);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logCheck(string memory institution, string memory role) public onlyAdmin {
        checks.push(Check(institution, role, block.timestamp));
        emit CheckLogged(institution, role);
    }

    function getCheck(uint256 index) public view returns (string memory institution, string memory role, uint256 timestamp) {
        Check memory c = checks[index];
        return (c.institution, c.role, c.timestamp);
    }
}
