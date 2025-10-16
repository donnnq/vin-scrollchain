// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract JudicialConsequenceDAO {
    address public admin;

    struct CaseEntry {
        string caseLabel;
        string consequenceClause;
        string emotionalTag;
        bool prosecuted;
    }

    CaseEntry[] public cases;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _caseLabel, string memory _consequenceClause, string memory _emotionalTag) external onlyAdmin {
        cases.push(CaseEntry(_caseLabel, _consequenceClause, _emotionalTag, false));
    }

    function prosecuteEntry(uint256 index) external onlyAdmin {
        cases[index].prosecuted = true;
    }

    function getEntry(uint256 index) external view returns (CaseEntry memory) {
        return cases[index];
    }
}
