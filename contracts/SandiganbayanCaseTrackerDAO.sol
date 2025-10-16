// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SandiganbayanCaseTrackerDAO {
    address public admin;

    struct CaseEntry {
        string caseLabel;
        string division;
        string filingDate;
        string emotionalTag;
        bool active;
        bool resolved;
    }

    CaseEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitCase(string memory caseLabel, string memory division, string memory filingDate, string memory emotionalTag) external onlyAdmin {
        entries.push(CaseEntry(caseLabel, division, filingDate, emotionalTag, true, false));
    }

    function markResolved(uint256 index) external onlyAdmin {
        entries[index].resolved = true;
        entries[index].active = false;
    }

    function getCase(uint256 index) external view returns (CaseEntry memory) {
        return entries[index];
    }
}
