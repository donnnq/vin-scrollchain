// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract JudicialConsequenceDAO {
    address public admin;

    struct CaseEntry {
        string respondent;
        string allegation;
        string emotionalTag;
        bool filed;
        bool convicted;
    }

    CaseEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function fileCase(string memory respondent, string memory allegation, string memory emotionalTag) external onlyAdmin {
        entries.push(CaseEntry(respondent, allegation, emotionalTag, true, false));
    }

    function convictRespondent(uint256 index) external onlyAdmin {
        entries[index].convicted = true;
    }

    function getCase(uint256 index) external view returns (CaseEntry memory) {
        return entries[index];
    }
}
