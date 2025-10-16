// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FloodControlCriminalCaseDAO {
    address public admin;

    struct CriminalCase {
        string suspectName;
        string caseLabel;
        string evidenceSummary;
        string emotionalTag;
        bool filed;
    }

    CriminalCase[] public cases;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitCase(string memory suspectName, string memory caseLabel, string memory evidenceSummary, string memory emotionalTag) external onlyAdmin {
        cases.push(CriminalCase(suspectName, caseLabel, evidenceSummary, emotionalTag, false));
    }

    function fileCase(uint256 index) external onlyAdmin {
        cases[index].filed = true;
    }

    function getCase(uint256 index) external view returns (CriminalCase memory) {
        return cases[index];
    }
}
