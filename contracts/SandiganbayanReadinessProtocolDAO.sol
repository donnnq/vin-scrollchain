// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SandiganbayanReadinessProtocolDAO {
    address public admin;

    struct CaseFile {
        string caseTitle;
        string respondent;
        bool trialReady;
        bool withdrawn;
    }

    CaseFile[] public cases;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitCase(string memory _caseTitle, string memory _respondent) external onlyAdmin {
        cases.push(CaseFile(_caseTitle, _respondent, false, false));
    }

    function markTrialReady(uint256 index) external onlyAdmin {
        cases[index].trialReady = true;
    }

    function withdrawCase(uint256 index) external onlyAdmin {
        cases[index].withdrawn = true;
    }

    function getCase(uint256 index) external view returns (CaseFile memory) {
        return cases[index];
    }
}
