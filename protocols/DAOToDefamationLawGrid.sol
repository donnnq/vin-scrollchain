// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToDefamationLawGrid {
    string public batchID = "1321.9.158";
    string public steward = "Vinvin";

    address public admin;

    struct DefamationCase {
        string jurisdiction;   // e.g., US, UK
        string threshold;      // actual malice, libel standards
        string claimant;
        string respondent;
        uint256 timestamp;
    }

    DefamationCase[] public cases;

    event CaseLogged(string jurisdiction, string claimant, string respondent);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logCase(string memory jurisdiction, string memory threshold, string memory claimant, string memory respondent) public onlyAdmin {
        cases.push(DefamationCase(jurisdiction, threshold, claimant, respondent, block.timestamp));
        emit CaseLogged(jurisdiction, claimant, respondent);
    }

    function getCase(uint256 index) public view returns (string memory jurisdiction, string memory threshold, string memory claimant, string memory respondent, uint256 timestamp) {
        DefamationCase memory c = cases[index];
        return (c.jurisdiction, c.threshold, c.claimant, c.respondent, c.timestamp);
    }
}
